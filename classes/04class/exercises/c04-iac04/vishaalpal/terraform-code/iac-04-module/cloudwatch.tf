resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "${aws_autoscaling_policy.scale_up.name} - high cpu"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "3"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = var.ec2_high_cpu_threshold
  actions_enabled     = true
  alarm_description   = "This alarm will trigger the autoscaling policy ${aws_autoscaling_policy.scale_up.name}."
  alarm_actions       = [aws_autoscaling_policy.scale_up.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }

  tags = {
    Author = "Vishaal Pal"
    Name   = "${aws_autoscaling_policy.scale_up.name}-high cpu"
  }
}

resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  alarm_name          = "${aws_autoscaling_policy.scale_down.name} - low cpu"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "3"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = var.ec2_low_cpu_threshold
  actions_enabled     = true
  alarm_description   = "This alarm will trigger the autoscaling policy ${aws_autoscaling_policy.scale_down.name}."
  alarm_actions       = [aws_autoscaling_policy.scale_down.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }

  tags = {
    Author = "Vishaal Pal"
    Name   = "${aws_autoscaling_policy.scale_down.name} - low cpu"
  }
}
