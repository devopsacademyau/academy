resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [var.subnets_public_1_id,var.subnets_public_2_id]

  security_groups = [
    var.app_load_balancer_security_group_id
  ]

  tags = {
    Name = "${var.project}_alb"
  }
}


resource "aws_lb_target_group" "albtargetgroup" {
  name     = "albtargetgroup"
  vpc_id   = var.vpc_id
  port     = "80"
  protocol = "HTTP"
  tags = {
    name = "${var.project}_alb_target_group"
  }
  
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port     = "80"
  protocol = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.albtargetgroup.arn
  }
}


resource "aws_launch_configuration" "launch_configuration" {
  image_id        = var.image_id
  instance_type   = var.instance_type
  security_groups = [var.autoscaling_security_group_id]
  associate_public_ip_address = true
  user_data                   = <<EOF
    #! /bin/bash
    yum update -y
    yum install -y httpd
    echo Welcome to the end of exercise c04-iac04 > index.html
    mv index.html /var/www/html/
    systemctl start httpd
 EOF
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "autoscale_group" {
  launch_configuration = "aws_launch_configuration.launch_configuration.id"
  vpc_zone_identifier  = [var.subnets_private_1_id,var.subnets_private_2_id]
  load_balancers       = [aws_lb.alb.arn]
  min_size             = var.min_size
  max_size             = var.max_size
  tag {
    key                 = "Name"
    value               = "autoscale_group"
    propagate_at_launch = true
  }
}

resource "aws_cloudwatch_metric_alarm" "add" {
  alarm_name          = "${var.project}_add"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  statistic           = "Average"
  period              = 120
  evaluation_periods  = 2
  threshold           = 60
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_actions = [
    aws_autoscaling_policy.asg_policy_increase.arn
  ]
}

resource "aws_cloudwatch_metric_alarm" "remove" {
  alarm_name          = "${var.project}_Remove"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Average"
  period              = 120
  evaluation_periods  = 2
  threshold           = 40
  comparison_operator = "LessThanOrEqualToThreshold"
  alarm_actions = [
    aws_autoscaling_policy.asg_policy_decrease.arn
  ]
}
resource "aws_autoscaling_policy" "asg_policy_increase" {
  name                   = "${var.project})_asg-policy-increase"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 120
  autoscaling_group_name   = var.autoscaling_security_group_name
}

resource "aws_autoscaling_policy" "asg_policy_decrease" {
  name                   = "${var.project})_asg-policy-decrease"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 120
  autoscaling_group_name   = var.autoscaling_security_group_name
}


#resource "aws_autoscaling_attachment" "alb_autoscale" {
 # alb_target_group_arn   = aws_lb_target_group.albtargetgroup.arn
 # autoscaling_group_name = var.app_load_balancer_security_group_id
#}


