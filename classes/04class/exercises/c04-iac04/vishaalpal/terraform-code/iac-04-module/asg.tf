# Filter the most recent Amazon Linux 2 ami id 
data "aws_ami" "ami" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

# Launch template configuration for an autoscaling group 
resource "aws_launch_template" "asg_launch_template" {
  name          = "${var.project_name}-asg-launch-template"
  description   = var.asg_launch_template_desc
  image_id      = data.aws_ami.ami.id
  instance_type = var.asg_launch_template_instance_type
  key_name      = var.ec2_key_pair
  user_data     = filebase64("./iac-04-module/install_apache.sh")

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.private_instance_sg.id]
  }

  tags = {
    Author = "Vishaal Pal"
    Name   = "${var.project_name}-asg-launch-template"
  }
}

# Autoscaling group to deploy instances in private subnets
resource "aws_autoscaling_group" "asg" {
  name                = "${var.project_name}-asg"
  max_size            = var.asg_max_size
  min_size            = var.asg_min_size
  vpc_zone_identifier = ["${var.private_subnets[0]}", "${var.private_subnets[1]}"]
  target_group_arns   = [aws_alb_target_group.alb_tg.arn]
  desired_capacity    = var.asg_desired_capacity

  launch_template {
    id      = aws_launch_template.asg_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Author"
    value               = "Vishaal Pal"
    propagate_at_launch = true
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-asg"
    propagate_at_launch = true
  }
}

# Autoscaling group scale-up policy 
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.project_name}-scale up policy"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "SimpleScaling"
  cooldown               = 30
  scaling_adjustment     = 1
}

# Autoscaling group scale-down policy
resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${var.project_name}-scale down policy"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "SimpleScaling"
  cooldown               = 30
  scaling_adjustment     = -1
}
