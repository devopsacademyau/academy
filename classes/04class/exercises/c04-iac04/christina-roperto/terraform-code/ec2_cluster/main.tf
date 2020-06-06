resource "aws_launch_configuration" "this" {
  image_id        = var.image_id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.asg.id]
  key_name        = "Christina AWS"

  user_data = <<EOF
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

resource "aws_autoscaling_group" "this" {
  max_size             = 2
  min_size             = 1
  health_check_type    = "EC2"
  desired_capacity     = 2
  force_delete         = true
  vpc_zone_identifier  = var.subnet_public_ids
  launch_configuration = aws_launch_configuration.this.name
  target_group_arns    = [aws_lb_target_group.this.arn]

  tag {
    key                 = "lorem"
    value               = "ipsum"
    propagate_at_launch = false
  }
}

resource "aws_autoscaling_policy" "up" {
  name                   = "asg-scaling-up"
  scaling_adjustment     = var.scale_up
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.this.name
}

resource "aws_autoscaling_policy" "down" {
  name                   = "asg-scaling-down"
  scaling_adjustment     = abs(var.scale_down) * -1 # ensuring the number is always negative
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.this.name
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${var.exercise_name}_ec2_cpu_high"
  alarm_description   = "Alerts if the CPU usage on EC2 is high"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  statistic           = "Average"
  evaluation_periods  = 2
  period              = 120
  threshold           = 80

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.this.name
  }

  alarm_actions = [aws_autoscaling_policy.up.arn]
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "${var.exercise_name}_ec2_cpu_low"
  alarm_description   = "Alerts if the CPU usage on EC2 is low"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  comparison_operator = "LessThanOrEqualToThreshold"
  statistic           = "Average"
  evaluation_periods  = 2
  period              = 120
  threshold           = 20

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.this.name
  }

  alarm_actions = [aws_autoscaling_policy.down.arn]
}

resource "aws_security_group" "asg" {
  vpc_id = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  tags = {
    Name = "sg_${var.exercise_name}"
  }
}


resource "aws_lb" "this" {
  name               = "lb-tf"
  load_balancer_type = "application"
  subnets            = var.subnet_public_ids
  internal           = false
  security_groups    = [aws_security_group.asg.id]

  tags = {
    Name = "alb_${var.exercise_name}"
  }
}

resource "aws_lb_target_group" "this" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  tags = {
    Name = "alb_tg_${var.exercise_name}"
  }
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
