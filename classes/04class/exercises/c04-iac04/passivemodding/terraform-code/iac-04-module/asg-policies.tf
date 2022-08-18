# following https://learn.hashicorp.com/tutorials/terraform/aws-asg

# note variables should be min <= desired <= max
resource "aws_autoscaling_group" "this" {
  desired_capacity    = var.desired_instance_count
  max_size            = var.max_instance_count
  min_size            = var.min_instance_count
  vpc_zone_identifier = var.public_asg_subnets

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }
}

resource "aws_cloudwatch_metric_alarm" "upper_cpu_scale_out" {
  alarm_name = "upper_cpu_scale_out"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Average"
  period              = 120
  evaluation_periods  = 2
  threshold           = var.cpu_upper_limit
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_actions = [
    aws_autoscaling_policy.scale_out.arn
  ]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.this.name
  }
}

# + 30 to capacity
resource "aws_autoscaling_policy" "scale_out" {
  name                   = "scale_out"
  adjustment_type        = "PercentChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.this.name
  scaling_adjustment     = 30
}

resource "aws_cloudwatch_metric_alarm" "lower_cpu_scale_in" {
  alarm_name = "lower_cpu_scale_in"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Average"
  period              = 120
  evaluation_periods  = 2
  threshold           = var.cpu_lower_limit
  comparison_operator = "LessThanOrEqualToThreshold"
  alarm_actions = [
    aws_autoscaling_policy.scale_in.arn
  ]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.this.name
  }
}

# -1 to capacity
resource "aws_autoscaling_policy" "scale_in" {
  name                   = "scale_in"
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.this.name
  scaling_adjustment     = -1
  cooldown               = 180
}