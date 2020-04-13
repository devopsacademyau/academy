resource "aws_autoscaling_group" "my_auto_scaling_group" {
  name                 = "my-auto-scaling-group"
  launch_configuration = aws_launch_configuration.my_launch_configuration.name
  vpc_zone_identifier  = data.aws_subnet_ids.my_subnet_ids.ids
  max_size             = 2
  min_size             = 1
}

resource "aws_autoscaling_policy" "my_autoscalind_policy_increase" {
  name                   = "my-autoscalind-policy-increase"
  policy_type            = "TargetTrackingScaling"
  adjustment_type        = "PercentChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.my_auto_scaling_group.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 80.0
  }
}

resource "aws_autoscaling_policy" "my_autoscalind_policy_decrease" {
  name                   = "my-autoscalind-policy-decrease"
  policy_type            = "TargetTrackingScaling"
  adjustment_type        = "PercentChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.my_auto_scaling_group.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 30.0
  }
}
