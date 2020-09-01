


#LOAD BALANCER

resource "aws_lb" "tf-da-lb" {
  name               = "c04-iac04-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    =  [aws_security_group.tf-da-sg.id]
  subnets            =  var.subnets
  enable_deletion_protection = false
  
   tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "tf-da-tg" {
  name     = "c04-iac04-tg"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = var.vpc_id
   health_check {
    interval = 200
  }
}


resource "aws_autoscaling_attachment" "tf-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.tf-da-asg.id
  alb_target_group_arn   = aws_lb_target_group.tf-da-tg.arn
}

resource "aws_lb_listener" "tf-da-lb-listener" {
  load_balancer_arn = aws_lb.tf-da-lb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf-da-tg.arn
  }
}


#AUTO SCALING GROUP

resource "aws_launch_configuration" "tf-da-asgconf" {
  name          = "c04-iac04-config"
  image_id      = var.image_id
  instance_type = "t2.micro"
  key_name      = "C01-AWS01KeyPair"
  associate_public_ip_address = true
  security_groups    =  [aws_security_group.tf-da-sg.id]
    user_data = base64encode(<<EOF
    #! /bin/bash
    yum update -y
    yum install -y httpd
    curl 169.254.169.254/latest/meta-data/hostname >> index.html
    mv index.html /var/www/html/
    systemctl start httpd
    EOF
  )
}

resource "aws_autoscaling_group" "tf-da-asg" {
  name                 = "c04-iac04-asg"
  launch_configuration =  aws_launch_configuration.tf-da-asgconf.name
  min_size             =  1
  max_size             =  2
  vpc_zone_identifier  = var.subnets
}


#AUTO SCALING GROUP POLICIES [Increase and decrease Policies]

resource "aws_autoscaling_policy" "tf-da-scale-out" {
  name                   = "c04-aws04-scale-out"
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.tf-da-asg.name
  scaling_adjustment     = 1
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "tf-da_add_capacity" {
  alarm_name          = "c04-iac04-Alarm-AddCapacity"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  statistic           = "Average"
  period              = 60
  evaluation_periods  = 2
  threshold           = var.cpu-upper-limit
  comparison_operator = "GreaterThanOrEqualToThreshold"
  
  alarm_actions = [
    aws_autoscaling_policy.tf-da-scale-out.arn
  ]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.tf-da-asg.name
  }
}

resource "aws_autoscaling_policy" "tf-da-scale-in" {
  name                   = "c04-iac04-scale-in"
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.tf-da-asg.name
  scaling_adjustment     = -1
  cooldown               = 180
} 
resource "aws_cloudwatch_metric_alarm" "tf-da-remove-capacity" {
  alarm_name          = "c04-iac04-Alarm-RemoveCapacity"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Average"
  period              = 60
  evaluation_periods  = 2
  threshold           = var.cpu-lower-limit
  comparison_operator = "LessThanOrEqualToThreshold"
  
  alarm_actions = [
    aws_autoscaling_policy.tf-da-scale-in.arn
  ]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.tf-da-asg.name
  }
}


#SECURITY GROUP

resource "aws_security_group" "tf-da-sg" {
  name        = "c04-iac04-sg"
  vpc_id      =  var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "c04-iac04-sg"
  }
}
