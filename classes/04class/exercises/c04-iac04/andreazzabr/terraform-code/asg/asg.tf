resource "aws_launch_configuration" "asglc" {
    name_prefix = "${var.projectname}-lc"
    image_id = var.ami
    instance_type = var.inst_type
    key_name = var.key_name != "" ? var.key_name : ""
    associate_public_ip_address = "true"
    security_groups = var.asg_dependson
    user_data = file("./asg/userdata.sh")
    lifecycle {
        create_before_destroy = true
    }
    depends_on = [var.asg_dependson]
}
resource "aws_autoscaling_group" "asg" {
    name_prefix = "${var.projectname}-asg"
    launch_configuration = aws_launch_configuration.asglc.name
    vpc_zone_identifier = flatten(var.publicsubnets_ids)
    min_size = 2
    max_size = 4
    target_group_arns = [var.albarn]
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_autoscaling_policy" "asgpolup" {
    name = "${var.projectname}-asgpolup"
    autoscaling_group_name = aws_autoscaling_group.asg.name
    scaling_adjustment = 1
    adjustment_type = "ChangeInCapacity"
    cooldown = 300
}
resource "aws_autoscaling_policy" "asgpoldown" {
    name = "${var.projectname}-asgpoldown"
    autoscaling_group_name = aws_autoscaling_group.asg.name
    scaling_adjustment = -1
    adjustment_type = "ChangeInCapacity"
    cooldown = 300
}

resource "aws_cloudwatch_metric_alarm" "up" {
    alarm_name = "${var.projectname}-cw-alarmup"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/AutoScaling"
    period = "60"
    statistic = "Average"
    threshold = "80"
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.asg.name
    }
    alarm_description = "metric monitors ec2 cpu utilization and scale up if necessary"
    alarm_actions = [aws_autoscaling_policy.asgpolup.arn]
}
resource "aws_cloudwatch_metric_alarm" "down" {
    alarm_name = "${var.projectname}-cw-alarmdown"
    comparison_operator = "LessThanThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/AutoScaling"
    period = "60"
    statistic = "Average"
    threshold = "80"
    dimensions = {
        AutoScalingGroupName = aws_autoscaling_group.asg.name
    }
    alarm_description = "metric monitors ec2 cpu utilization and scale down when necessary"
    alarm_actions = [aws_autoscaling_policy.asgpoldown.arn]
}
