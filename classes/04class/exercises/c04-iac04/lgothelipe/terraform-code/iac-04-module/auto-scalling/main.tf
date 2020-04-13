# Auto Scaling Group - Policies
resource "aws_autoscaling_policy" "increase" {
  name                   = "asg-policy-up"
  scaling_adjustment     = var.scaling_up
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.devops.name
}

resource "aws_autoscaling_policy" "decrease" {
  name                   = "asg-policy-down"
  scaling_adjustment     = var.scaling_down
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.devops.name
}

# Auto Scaling Group - ASG
resource "aws_autoscaling_group" "devops" {
  availability_zones = ["ap-southeast-2a"]
  name                      = "devops_c04_iac04"
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  launch_template {
    id      = var.launch_temp_id
    version = "$Latest"

  }
}

# Instance Target Group
resource "aws_lb_target_group" "devops_target" {
  name     = "devops-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id = var.default_vpc_id
}


# Attach EC2 to target group
resource "aws_lb_target_group_attachment" "devops_attach" {
  target_group_arn = aws_lb_target_group.devops_target.arn
  target_id        = data.aws_instance.devops.id
  port             = 80
}

# EC2 Instance_id
data "aws_instance" "devops" {
    filter {
    name   = "image-id"
    values = [var.image_id]
  }
  
  depends_on = [aws_autoscaling_group.devops]
}
