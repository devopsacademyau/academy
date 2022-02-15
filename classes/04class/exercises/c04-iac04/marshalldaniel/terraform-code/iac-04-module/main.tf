resource "aws_lb" "iac04-alb" {
  name               = "iac04-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.iac04-alb-sg.id]
  subnets            = [var.subnet1,var.subnet2]

  enable_deletion_protection = false
}

resource "aws_security_group" "iac04-alb-sg" {
  name        = "iac04-alb-sg"
  description = "Allow 80 inbound traffic"
  vpc_id      = "vpc-0d91d246cabb35035"

  ingress {
    description      = "80 from all"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "iac04-alb-sg"
  }
}

resource "aws_security_group" "iac04-asg-sg" {
  name        = "iac04-asg-sg"
  description = "Allow 80 inbound traffic from alb"
  vpc_id      = "vpc-0d91d246cabb35035"

  ingress {
    description      = "80 from alb"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.iac04-alb-sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "iac04-asg-sg"
  }
}

resource "aws_launch_configuration" "iac04-launch-config" {
  name          = "iac04-launch-config"
  image_id      = var.ami_web
  instance_type = "t3.micro"
  security_groups = [aws_security_group.iac04-asg-sg.id]
  user_data = <<EOF
#!/bin/bash
yum update -y
amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
yum install -y httpd mariadb-server
systemctl start httpd
systemctl enable httpd
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php"
EOF
}

resource "aws_autoscaling_group" "iac04-asg" {
  name                      = "iac04-asg"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 1
  force_delete              = true
  launch_configuration      = aws_launch_configuration.iac04-launch-config.name
  vpc_zone_identifier       = [var.subnet1, var.subnet2]

  timeouts {
    delete = "15m"
  }
}

# scale up alarm
resource "aws_autoscaling_policy" "iac04-scale-out" {
  name = "iac04-scale-out"
  autoscaling_group_name = "${aws_autoscaling_group.iac04-asg.name}"
  adjustment_type = "ChangeInCapacity"
  scaling_adjustment = var.scale_out_amount
  cooldown = "300"
  policy_type = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "iac04-high-cpu-alarm" {
  alarm_name = "iac04-high-cpu-alarm"
  alarm_description = "iac04-high-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "80"
  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.iac04-asg.name}"
  }
  actions_enabled = true
  alarm_actions = ["${aws_autoscaling_policy.iac04-scale-out.arn}"]
}


# scale in alarm
resource "aws_autoscaling_policy" "iac04-scale-in" {
  name = "iac04-scale-in"
  autoscaling_group_name = "${aws_autoscaling_group.iac04-asg.name}"
  adjustment_type = "ChangeInCapacity"
  scaling_adjustment = var.scale_in_amount
  cooldown = "300"
  policy_type = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "iac04-low-cpu-alarm" {
  alarm_name = "iac04-low-cpu-alarm"
  alarm_description = "iac04-low-cpu-alarm"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "30"
  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.iac04-asg.name}"
  }
  actions_enabled = true
  alarm_actions = ["${aws_autoscaling_policy.iac04-scale-in.arn}"]
}

resource "aws_autoscaling_attachment" "iac04-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.iac04-asg.id
  lb_target_group_arn = aws_lb_target_group.iac04-target-group.arn
}

resource "aws_lb_target_group" "iac04-target-group" {
  name     = "iac04-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0d91d246cabb35035"
}

resource "aws_lb_listener" "iac04-alb-listener" {
  load_balancer_arn = aws_lb.iac04-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.iac04-target-group.arn
  }
}
