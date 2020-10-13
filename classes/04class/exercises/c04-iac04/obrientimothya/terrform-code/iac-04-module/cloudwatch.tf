resource "aws_cloudwatch_metric_alarm" "mem-high" {
    alarm_name = "mem-scale-up-${var.app_name}"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "MemoryUtilization"
    namespace = "System/Linux"
    period = "300"
    statistic = "Average"
    threshold = var.mem_scale_up_threshold
    alarm_description = "MEM scale up trigger ${var.app_name}"
    alarm_actions = [
        aws_autoscaling_policy.scale_up.arn
    ]
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.httpd.name
    }
}

resource "aws_cloudwatch_metric_alarm" "mem-low" {
    alarm_name = "mem-scale-down-${var.app_name}"
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "MemoryUtilization"
    namespace = "System/Linux"
    period = "300"
    statistic = "Average"
    threshold = var.mem_scale_down_threshold
    alarm_description = "MEM scale down trigger ${var.app_name}"
    alarm_actions = [
        aws_autoscaling_policy.scale_down.arn
    ]
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.httpd.name
    }
}
