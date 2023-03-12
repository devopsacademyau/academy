# Launch configuration for ec2 instances
resource "aws_launch_configuration" "app" {
  name_prefix   = "williamda-"
  image_id      = var.ami
  instance_type = "t2.micro"
  key_name = var.key_pair
  security_groups = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  user_data = file("./iac-04-module/userdata.sh")

  lifecycle {
    create_before_destroy = true
  }
}

# Autoscaling group for web
resource "aws_autoscaling_group" "app_asg" {
  name                 = "williamda-asg"
  launch_configuration = aws_launch_configuration.app.name
  min_size             = 1
  max_size             = 2
  desired_capacity = 1

  health_check_type         = "ELB"
  vpc_zone_identifier = [aws_subnet.subnet_public_a.id, aws_subnet.subnet_public_b.id]
  target_group_arns = [aws_lb_target_group.tg.arn]

  lifecycle {
    create_before_destroy = true
  }
}

# Policy for the autoscaling group
resource "aws_autoscaling_policy" "up" {
  name                   = "asg_up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.app_asg.name
}

resource "aws_autoscaling_policy" "down" {
  name                   = "asg_down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.app_asg.name
}