
resource "aws_cloudwatch_metric_alarm" "high_add_capacity" {
  alarm_name          = "${var.devops_class}-AlarmHigh-AddCapacity"
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  statistic           = "Average"
  period              = 120
  evaluation_periods  = 2
  threshold           = var.scale_out_when_cpu_usage_greater_than
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_description   = "Monitor high CPU utilization in EC2 instances inside ASG ${aws_autoscaling_group.devops.name}"
  alarm_actions = [
    aws_autoscaling_policy.scale_out.arn
  ]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.devops.name
  }
}

resource "aws_cloudwatch_metric_alarm" "low_remove_capacity" {
  alarm_name          = "${var.devops_class}-AlarmLow-RemoveCapacity"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Average"
  period              = 120
  evaluation_periods  = 2
  threshold           = var.scale_in_when_cpu_usage_lower_than
  comparison_operator = "LessThanOrEqualToThreshold"
  alarm_description   = "Monitor low CPU utilization in EC2 instances inside ASG ${aws_autoscaling_group.devops.name}"
  alarm_actions = [
    aws_autoscaling_policy.scale_in.arn
  ]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.devops.name
  }
}

resource "aws_autoscaling_policy" "scale_out" {
  name                   = "${var.devops_class}-asg-scale-out-policy"
  adjustment_type        = "PercentChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.devops.name
  scaling_adjustment     = 30
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = "${var.devops_class}-asg-scale-in-policy"
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.devops.name
  scaling_adjustment     = -1
  cooldown               = 180
}