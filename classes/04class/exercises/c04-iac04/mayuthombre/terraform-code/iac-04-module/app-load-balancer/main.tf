# Create
resource "aws_lb" "mayu_alb" {
  name               = "mayu-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnets_id

  tags = {
    Environment = "mayu_exercise"
  }
}

# Application Load Balancer - Listener
resource "aws_lb_listener" "mayu_alb" {
  load_balancer_arn = aws_lb.mayu_alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}