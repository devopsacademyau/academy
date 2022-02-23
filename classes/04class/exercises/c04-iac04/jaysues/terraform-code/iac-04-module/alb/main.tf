resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [var.subnets_public_1_id,var.subnets_public_2_id]
  security_groups = [var.app_load_balancer_security_group_id]

  tags = {
    Name = "${var.project}_alb"
  }
}


resource "aws_lb_target_group" "albtargetgroup" {
  name     = "albtargetgroup"
  vpc_id   = var.vpc_id
  port     = "80"
  protocol = "HTTP"
  health_check {
    interval = 200
  }
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
  instance_type = "t2.micro"
  security_groups = [var.app_load_balancer_security_group_id]
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

resource "aws_autoscaling_group" "autoscale-group" {
   name                        	= "autoscale-group"
   max_size                    	= var.max_size
   min_size                    	= var.min_size
  vpc_zone_identifier         	= [var.subnets_public_1_id,var.subnets_public_2_id]
  launch_configuration        	= aws_launch_configuration.launch_configuration.name
   health_check_type           	= "EC2"
   health_check_grace_period 	= 0
   default_cooldown          	= 300
   termination_policies      	= ["OldestInstance"]
     tag {
     key        			= "Name"
     value        			= "${var.project}-autoscale-group"
     propagate_at_launch 		= true 
  	}
  }
  

resource "aws_cloudwatch_metric_alarm" "add" {
  alarm_name          = "${var.project}_add"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  statistic           = "Average"
  period              = 60
  evaluation_periods  = 2
  threshold           = var.add_threshold
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
  period              = 60
  evaluation_periods  = 2
  threshold           = var.remove_threshold
  comparison_operator = "LessThanOrEqualToThreshold"
  alarm_actions = [
    aws_autoscaling_policy.asg_policy_decrease.arn
  ]
}
resource "aws_autoscaling_policy" "asg_policy_increase" {
  name                   = "${var.project}_asg-policy-increase"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name   = aws_autoscaling_group.autoscale-group.name
}

resource "aws_autoscaling_policy" "asg_policy_decrease" {
  name                   = "${var.project}_asg-policy-decrease"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name   = aws_autoscaling_group.autoscale-group.name
}


resource "aws_autoscaling_attachment" "alb_autoscale_attach" {
  alb_target_group_arn   = aws_lb_target_group.albtargetgroup.arn
  autoscaling_group_name = aws_autoscaling_group.autoscale-group.name
}