# Cloudwatch cpu usage alarm for high usage
resource "aws_cloudwatch_metric_alarm" "web_cpu_up" {
    alarm_name = "web_cpu_up"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "120"
    statistic = "Average"
    threshold = var.high_cpu_threshold
    dimensions = {
        autoscaling_group_name = aws_autoscaling_policy.up.name
    }

    alarm_actions = [ aws_autoscaling_policy.up.arn]
}

# Cloudwatch cpu usage alarm for low usage
resource "aws_cloudwatch_metric_alarm" "web_cpu_down" {
    alarm_name = "web_cpu_down"
    comparison_operator = "LessThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "120"
    statistic = "Average"
    threshold = var.low_cpu_threshold
    dimensions = {
        autoscaling_group_name = aws_autoscaling_policy.down.name
    }

    alarm_actions = [ aws_autoscaling_policy.down.arn]
}