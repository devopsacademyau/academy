resource "aws_security_group" "sg_asg" {
    name = "sg_asg"
    vpc_id = var.vpc_id

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_launch_configuration" "ec2_lc" {
    image_id = var.ami
    instance_type = var.instance_type
    security_groups = [aws_security_group.sg_asg.id]
    associate_public_ip_address = true
    user_data_base64      =  base64encode(<<EOF
    #! /bin/bash
    yum update -y
    yum install -y httpd
    curl 169.254.169.254/latest/meta-data/hostname >> index.html
    mv index.html /var/www/html/
    systemctl start httpd
        EOF
    )
    lifecycle {
        create_before_destroy = true
    }
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
    max_size = 3
    min_size = 2
    launch_configuration = aws_launch_configuration.ec2_lc.name
    health_check_grace_period = 0
    health_check_type = "EC2"
    vpc_zone_identifier  = flatten(var.public_subnets)

    tag {
        key = "name"
        propagate_at_launch = false
        value = "asg"
    }
    lifecycle {
        create_before_destroy = true
    }
}


resource "aws_cloudwatch_metric_alarm" "up" {
    alarm_name = "cw-alarmup"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/AutoScaling"
    period = "60"
    statistic = "Average"
    threshold = "80"
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.asg.name
    }
    alarm_description = "metric monitors ec2 cpu utilization and scale up if necessary"
    alarm_actions = [aws_autoscaling_policy.asp_increase.arn]
}
resource "aws_cloudwatch_metric_alarm" "down" {
    alarm_name = "cw-alarmdown"
    comparison_operator = "LessThanThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/AutoScaling"
    period = "60"
    statistic = "Average"
    threshold = "80"
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.asg.name
    }
    alarm_description = "metric monitors ec2 cpu utilization and scale down when necessary"
    alarm_actions = [aws_autoscaling_policy.asp_decrease.arn]
}

resource "aws_autoscaling_attachment" "alb_autoscale_attach" {
    alb_target_group_arn   = var.lb_arn
    autoscaling_group_name = aws_autoscaling_group.asg.name
}