resource "aws_launch_configuration" "launch_config" {
  name_prefix      = "devops-academy-c04-iac04-lc-"
  image_id         = var.ami_id
  instance_type    = var.instance_type
  user_data_base64 = filebase64("${path.module}/user_data.sh")
  key_name         = "DevOpsAcademy"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name                      = "asg-devops-academy-c04-iac04"
  depends_on                = [aws_launch_configuration.launch_config]
  vpc_zone_identifier       = [var.pub_cidr_id_a, var.pub_cidr_id_b, var.pub_cidr_id_c]
  desired_capacity          = var.asg_desired
  max_size                  = var.asg_max
  min_size                  = var.asg_min
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = "true"
  launch_configuration      = aws_launch_configuration.launch_config.id

  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "Name"
    value               = "asg-devops-academy-c04-iac04"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "asg_attach" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  alb_target_group_arn   = var.alb_tg_arn
}

resource "aws_autoscaling_policy" "ec2_cpu_policy_scale_out" {
  name                   = "ec2-cpu-policy-scale-out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.asg.name
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "ec2_cpu_alarm_scale_out" {
  alarm_name          = "ec2-cpu-alarm-scale-out"
  alarm_description   = "example-cpu-alarm-scale-out"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.asg.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.ec2_cpu_policy_scale_out.arn]
}

resource "aws_autoscaling_policy" "ec2_cpu_policy_scale_in" {
  name                   = "ec2-cpu-policy-scale-in"
  scaling_adjustment     = "-1"
  adjustment_type        = "ChangeInCapacity"
  cooldown               = "300"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "ec2_cpu_alarm_scale_in" {
  alarm_name          = "ec2-cpu-alarm-scale-in"
  alarm_description   = "ec2-cpu-alarm-scale-in"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "30"
  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.asg.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.ec2_cpu_policy_scale_in.arn]
}