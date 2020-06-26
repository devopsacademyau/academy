# Application Load Balancer - ALB
resource "aws_lb" "devops_alb" {
  name               = "devops-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
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
    target_group_arn = var.target_group_arn
  }
}