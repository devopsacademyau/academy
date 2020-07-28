# SG for ALB with egress allowed only into ASG SG
resource "aws_security_group" "doa_alb_sg" {
  vpc_id = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 80
    to_port         = 80
    security_groups = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.doa_asg_instance_sg.id]
  }

  tags = {
    Name = "doa_alb_sg"
  }
}

# SG for ASG accepting traffic only from ALB SG
# and selected IPs
resource "aws_security_group" "doa_asg_instance_sg" {
  vpc_id = var.vpc_id

  ingress {
    protocol        = "tcp"
    from_port       = 80
    to_port         = 80
    security_groups = [aws_security_group.doa_alb_sg.id]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = [var.ssh_allowed_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "doa_asg_instance_sg"
  }
}

resource "aws_lb" "doa_alb" {
  name               = "doa_alb"
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids
  internal           = false
  security_groups    = [aws_security_group.doa_alb_sg.id]

  tags = {
    Name = "doa_alb"
  }
}

resource "aws_lb_target_group" "doa_alb_tg" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  tags = {
    Name = "doa_alb_tg"
  }
}

resource "aws_lb_listener" "doa_alb_listener" {
  load_balancer_arn = aws_lb.doa_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.doa_alb_tg.arn
  }
}

resource "aws_launch_configuration" "doa_asg_launch_conf" {
  image_id        = var.aws_ami
  instance_type   = var.instance_type
  key_name        = var.key_pair
  security_groups = [aws_security_group.doa_asg_instance_sg.id]
  user_data       = <<EOF
  #! /bin/bash
  yum update -y
  yum install -y httpd
  curl 169.254.169.254/latest/meta-data/hostname > index.html
  mv index.html /var/www/html/
  systemctl start httpd
EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "doa_asg" {
  name                 = "doa_asg"
  launch_configuration = aws_launch_configuration.doa_asg_launch_conf.name
  min_size             = var.asg_min
  max_size             = var.asg_max
  vpc_zone_identifier  = var.private_subnet_ids
  target_group_arns    = [aws_lb_target_group.doa_alb_tg.arn]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "doa_asg_capacity_increase" {
  name                   = "doa_asg_capacity_increase"
  scaling_adjustment     = var.scale_up_by
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.doa_asg.name
}

resource "aws_autoscaling_policy" "doa_asg_capacity_decrease" {
  name                   = "doa_asg_capacity_decrease"
  scaling_adjustment     = var.scale_down_by
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.doa_asg.name
}

# Cloudwatch alarms to trigger ASG policies
resource "aws_cloudwatch_metric_alarm" "doa_asg_cw_alarm_scale_up" {
    alarm_name = "doa_asg_cw_alarm_scale_up"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "10"
    metric_name = "CPUUtilization"
    namespace = "AWS/AutoScaling"
    period = "60"
    statistic = "Average"
    threshold = "80"
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.doa_asg.name
    }
    alarm_description = "Increase capacity if CPU utilization >=80 percent for 10 consecutive periods of 60 seconds"
    alarm_actions = [aws_autoscaling_policy.doa_asg_capacity_increase.arn]
}
resource "aws_cloudwatch_metric_alarm" "doa_asg_cw_alarm_scale_down" {
    alarm_name = "doa_asg_cw_alarm_scale_down"
    comparison_operator = "LessThanThreshold"
    evaluation_periods = "10"
    metric_name = "CPUUtilization"
    namespace = "AWS/AutoScaling"
    period = "60"
    statistic = "Average"
    threshold = "80"
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.doa_asg.name
    }
    alarm_description = "Decrease capacity if CPU utilization <80 percent for 10 consecutive periods of 60 seconds"
    alarm_actions = [aws_autoscaling_policy.doa_asg_capacity_decrease.arn]
}