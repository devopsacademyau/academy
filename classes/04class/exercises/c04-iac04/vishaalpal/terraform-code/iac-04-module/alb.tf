# Application load balancer configuration
resource "aws_alb" "alb" {
  name                       = "${var.project_name}-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb_sg.id]
  subnets                    = ["${var.public_subnets[0]}", "${var.public_subnets[1]}"]
  enable_deletion_protection = false

  tags = {
    Author = "Vishaal Pal"
    Name   = "${var.project_name}-alb"
  }
}

# Application load balancer target group configuration 
resource "aws_alb_target_group" "alb_tg" {
  name        = "${var.project_name}-alb-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 30
    timeout             = 10
    unhealthy_threshold = 2
    path                = "/"
  }

  tags = {
    Author = "Vishaal Pal"
    Name   = "${var.project_name}-alb-target-group"
  }
}

# Application load balancer listener configuration
resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.alb_tg.arn
  }

  tags = {
    Author = "Vishaal Pal"
    Name   = "${var.project_name}-alb-listener"
  }
}
