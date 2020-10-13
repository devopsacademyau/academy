resource "aws_security_group" "allow_http" {
  name   = "allow_http"
  vpc_id = var.vpc.id
  ingress {
    description = "Allow http connection"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "da_iac04_alb_sg"
  }
}

resource "aws_security_group" "allow_only_alb" {
  vpc_id = var.vpc.id
  name   = "allow_only_alb"
  ingress {
    description     = "Allow only ALB connection to EC2"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_http.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "da_iac04_ec2_sg"
  }
}




resource "aws_lb" "this" {
  name               = "da-iac04-lb"
  internal           = "false"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = var.public_subnet_ids

  tags = {
    Name = "daiac04alb"
  }
}

resource "aws_lb_target_group" "this" {
  name     = "da-iac04-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc.id
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}



resource "aws_launch_configuration" "this" {
  name_prefix                 = "da_iac04_launchconfig"
  image_id                    = var.ami_id
  instance_type               = "t2.micro"
  key_name                    = "Devopsacademy"
  user_data                   = <<EOF
    #! /bin/bash
    yum update -y
    yum install -y httpd
    echo Welcome to the end of exercise c04-iac04 > index.html
    mv index.html /var/www/html/
    systemctl start httpd
 EOF
  associate_public_ip_address = true
  security_groups             = [aws_security_group.allow_only_alb.id]
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "this" {
  name                 = "da_iac04_asg"
  vpc_zone_identifier  = var.public_subnet_ids
  launch_configuration = aws_launch_configuration.this.id
  target_group_arns    = [aws_lb_target_group.this.arn]
  min_size             = 1
  max_size             = 2

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "da_iac04_scale_up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.this.name

}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "da_iac04_scale_up"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.this.name
}

resource "aws_cloudwatch_metric_alarm" "scale_up" {
  alarm_name          = "da_iac04_cw_scaleup"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.this.name
  }

  alarm_description = "Monitors cpu utilization and scale up the instance"
  alarm_actions     = [aws_autoscaling_policy.scale_up.arn]
}



resource "aws_cloudwatch_metric_alarm" "scale_down" {
  alarm_name          = "da_iac04_cw_scaledwn"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.this.name
  }
  alarm_description = "Monitors cpu utilization and scale down the instance"
  alarm_actions     = [aws_autoscaling_policy.scale_down.arn]
}