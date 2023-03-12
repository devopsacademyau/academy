#Launch configuration 
resource "aws_launch_configuration" "launch_config" {
  name_prefix  = "c04-iac04-lc-"
  image_id = var.ami_id
  instance_type = var.instance_type
  security_groups = [var.alb_sg_id]
  key_name = "kp-devops-academy"

  lifecycle {
    create_before_destroy = true
  }
}

#ASG
resource "aws_autoscaling_group" "asg_1" {
  name = "c04-iac04-asg"
  min_size = var.asg_min
  desired_capacity = var.asg_desired
  max_size = var.asg_max

  vpc_zone_identifier = [var.pub_cidr_id_1, var.pub_cidr_id_2, var.pub_cidr_id_3]
  force_delete = true
  launch_configuration = aws_launch_configuration.launch_config.name
  health_check_type = "EC2"
  target_group_arns    = [var.alb_tg_arn]

  tag {
    key                 = "Name"
    value               = "c04-iac04-asg"
    propagate_at_launch = true
  }

  depends_on = [aws_launch_configuration.launch_config]
}

# ASG Policies
resource "aws_autoscaling_policy" "ec2_scale_out_policy" {
  name = "ec2_scale_out_policy"
  scaling_adjustment = 1
  adjustment_type  = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = aws_autoscaling_group.asg_1.name
  policy_type = "SimpleScaling"
}

resource "aws_autoscaling_policy" "ec2_scale_in_policy" {
  name = "ec2_scale_in_policy"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = aws_autoscaling_group.asg_1.name
  policy_type = "SimpleScaling"
}

#Cloud Watch alarms 
resource "aws_cloudwatch_metric_alarm" "ec2_scale_out_policy_alarm" {
  alarm_name = "ec2-scale-out-policy-alarm"
  alarm_description = "Alert ec2 CPU high usage"
  namespace = "AWS/EC2"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name = "CPUUtilization"
  statistic = "Average"
  actions_enabled = true

  evaluation_periods = 2
  period = 60
  threshold = 75

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.asg_1.name
  }

  alarm_actions   = [aws_autoscaling_policy.ec2_scale_out_policy.arn]
}

resource "aws_cloudwatch_metric_alarm" "ec2_scale_in_policy_alarm" {
  alarm_name = "ec2-scale-in-policy-alarm"
  alarm_description = "Alert ec2 CPU low usage"
  namespace = "AWS/EC2"
  comparison_operator = "LessThanOrEqualToThreshold"
  metric_name = "CPUUtilization"
  statistic = "Average"
  actions_enabled = true

  evaluation_periods = 2
  period = 60
  threshold = 30

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.asg_1.name
  }

  alarm_actions   = [aws_autoscaling_policy.ec2_scale_in_policy.arn]
}