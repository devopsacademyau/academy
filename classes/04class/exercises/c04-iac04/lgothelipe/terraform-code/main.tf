# Default VPC
module "default_vpc" {
  source = "./iac-04-module/default-vpc"
}

# Security Groups ALB
resource "aws_security_group" "alb" {
  name        = "alb"
  description = "Allow HTTP inbound traffic"

  ingress {
    description = "HTTP Inbound"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb"
  }
}

# Security Groups EC2
resource "aws_security_group" "allow_alb" {
  name        = "allow_alb"
  description = "Allow ALB inbound traffic"

  ingress {
    description = "HTTP Inbound"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_alb"
  }
}


# Launch Template
resource "aws_launch_template" "launch_temp" {
  name           = "devops_01"
  vpc_security_group_ids = [aws_security_group.allow_alb.id]
  image_id       = var.image_id
  instance_type  = "t2.micro"
  instance_initiated_shutdown_behavior = "terminate"
    placement {
    availability_zone = "ap-southeast-2a"
  }
user_data = base64encode(var.user_data)
}

# EC2 Instance_id
data "aws_instance" "devops" {
    filter {
    name   = "image-id"
    values = [var.image_id]
  }
  
  depends_on = [aws_autoscaling_group.devops,]
}

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
    id      = aws_launch_template.launch_temp.id
    version = "$Latest"

  }
}

# Instance Target Group
resource "aws_lb_target_group" "devops_target" {
  name     = "devops-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id = module.default_vpc.id
}


# Attach EC2 to target group
resource "aws_lb_target_group_attachment" "devops_attach" {
  target_group_arn = aws_lb_target_group.devops_target.arn
  target_id        = data.aws_instance.devops.id
  port             = 80
}


# Application Load Balancer - ALB
resource "aws_lb" "devops_alb" {
  name               = "devops-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = var.subnets_id

  tags = {
    Environment = "devops_exercise"
  }
}

# Application Load Balancer - Listener
resource "aws_lb_listener" "devops_alb" {
  load_balancer_arn = aws_lb.devops_alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.devops_target.arn
  }
}