##########################################################################################
# Get the latest Amazon linux 2 AMI ID from SSM Parameter Store
##########################################################################################
data "aws_ssm_parameter" "amzn2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

##########################################################################################
# Define launch configuration
##########################################################################################
resource "aws_launch_configuration" "web" {
  depends_on  = [aws_security_group.sg_web]
  name_prefix = "web-"

  image_id      = data.aws_ssm_parameter.amzn2_ami.value
  instance_type = "t2.micro"
  key_name      = var.ec2_key_name

  associate_public_ip_address = true

  security_groups = [aws_security_group.sg_web.id]

  user_data = file("./iac-04-module/install_apache.sh")

  lifecycle {
    create_before_destroy = true
  }
}

##########################################################################################
# Define auto scaling group
##########################################################################################
resource "aws_autoscaling_group" "web" {
  name       = "contino-james-asg"
  depends_on = [aws_launch_configuration.web, aws_lb_target_group.tg]

  min_size         = 1
  desired_capacity = 1
  max_size         = 2

  health_check_type         = "ELB"
  health_check_grace_period = 1500

  launch_configuration = aws_launch_configuration.web.name
  target_group_arns    = ["${aws_lb_target_group.tg.arn}"]

  vpc_zone_identifier = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]
  # Required to redeploy without an outage.
  lifecycle {
    create_before_destroy = true
  }
}

# scale up policy
resource "aws_autoscaling_policy" "scaleup" {
  name                   = "high-cpu-policy"
  autoscaling_group_name = aws_autoscaling_group.web.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

# scale up metric
resource "aws_cloudwatch_metric_alarm" "highalarm" {
  alarm_name          = "high_cpu_alarm"
  alarm_description   = "high-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = var.high_cpu_threshold
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.web.name
  }
  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.scaleup.arn}"]
}

# scale down policy
resource "aws_autoscaling_policy" "scaledown" {
  name                   = "low-cpu-policy"
  autoscaling_group_name = aws_autoscaling_group.web.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

# scale down metric
resource "aws_cloudwatch_metric_alarm" "lowalarm" {
  alarm_name          = "low-cpu-alarm"
  alarm_description   = "low-cpu-alarm"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = var.low_cpu_threshold
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.web.name
  }
  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.scaledown.arn}"]
}


