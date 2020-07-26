resource "aws_security_group" "sg_asg" {
    name = "sg_asg"
    vpc_id = data.aws_vpc.default.id

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        protocol = "tcp"
        to_port = 80
        security_groups = [aws_security_group.sg_load_balancer.id]
    }
}

resource "aws_launch_configuration" "ec2_lc" {
    image_id = var.ami
    instance_type = var.instance_type
    user_data = <<-EOF
                #!/bin/bash
                yum -y update
                yum -y install httpd
                echo "Website is Working !" > /var/www/html/index.html
                systemctl start httpd
                systemctl enable httpd
                EOF
    security_groups = [aws_security_group.sg_asg.id]

    lifecycle {
        create_before_destroy = true
    }
}

data "aws_vpc" "default" {
    default = true
}

data "aws_subnet_ids" "default" {
    vpc_id = data.aws_vpc.default.id
}


resource "aws_autoscaling_policy" "asp_increase" {
    name                   = "asp_increase"
    scaling_adjustment     = var.asg_policy_up
    adjustment_type        = "ChangeInCapacity"
    cooldown               = 300
    autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_autoscaling_policy" "asp_decrease" {
    name                   = "asp_decrease"
    scaling_adjustment     = var.asg_policy_down
    adjustment_type        = "ChangeInCapacity"
    cooldown               = 300
    autoscaling_group_name = aws_autoscaling_group.asg.name
}

resource "aws_autoscaling_group" "asg" {
    name = "asg"
    max_size = 2
    min_size = 1
    launch_configuration = aws_launch_configuration.ec2_lc.name
    health_check_grace_period = 300
    health_check_type = "ELB"
    vpc_zone_identifier = data.aws_subnet_ids.default.ids

    target_group_arns = [aws_lb_target_group.asg.arn]

    tag {
        key = "name"
        propagate_at_launch = false
        value = "asg"
    }
    lifecycle {
        create_before_destroy = true
    }
}