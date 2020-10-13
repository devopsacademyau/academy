resource "aws_autoscaling_policy" "cpu_policy_scale_out" {
  name                   = "${var.project_name}-${var.stack_name}-cpu-policy-scale-out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.autoscaling.name
  policy_type            = "SimpleScaling"
}

resource "aws_autoscaling_policy" "cpu_policy_scale_in" {
  name                   = "${var.project_name}-${var.stack_name}-cpu-policy-scale-in"
  scaling_adjustment     = "-1"
  adjustment_type        = "ChangeInCapacity"
  cooldown               = "300"
  autoscaling_group_name = aws_autoscaling_group.autoscaling.name
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm_scale_out" {
  alarm_name          = "${var.project_name}-${var.stack_name}-cpu-alarm-scale-out"
  alarm_description   = "${var.project_name}-${var.stack_name}-cpu-alarm-scale-out"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.autoscaling.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.cpu_policy_scale_out.arn]
}



resource "aws_cloudwatch_metric_alarm" "cpu_alarm_scale_in" {
  alarm_name          = "${var.project_name}-${var.stack_name}-cpu-alarm-scale-in"
  alarm_description   = "${var.project_name}-${var.stack_name}-cpu-alarm-scale-in"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "30"
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.autoscaling.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.cpu_policy_scale_in.arn]
}

