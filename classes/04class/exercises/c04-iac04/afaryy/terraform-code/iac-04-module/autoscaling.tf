#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template
resource "aws_launch_template" "template" {
  name            = "${var.project_name}-${var.stack_name}-template"
  image_id        = var.AMIS[var.aws_region]
  instance_type   = "t2.micro"
  key_name        = "da-key"
  vpc_security_group_ids = [aws_security_group.myinstance.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.project_name}-${var.stack_name}-instance"
    }
  }

  monitoring {
    enabled = true
  }

  user_data  = base64encode(data.template_file.shell-script.rendered)

  lifecycle {
    create_before_destroy = true
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group
resource "aws_autoscaling_group" "autoscaling" {
  name                      = "${var.project_name}-${var.stack_name}-autoscaling"
  vpc_zone_identifier       = var.subnets
  min_size                  = 1
  max_size                  = 2
  #health_check_grace_period = 300
  #health_check_type         = "ELB"
  #load_balancers            = [aws_lb.alb.name]
  #force_delete              = true

  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-${var.stack_name}-autoscaling"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "asg_attach" {
  autoscaling_group_name = aws_autoscaling_group.autoscaling.id
  alb_target_group_arn   = aws_lb_target_group.front_end.arn
}



