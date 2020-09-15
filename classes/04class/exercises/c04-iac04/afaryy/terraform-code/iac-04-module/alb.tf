resource "aws_lb" "alb" {
  name               = "${var.project_name}-${var.stack_name}-elb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_security_group.id]
  subnets            = var.subnets

  enable_deletion_protection = true

  tags = {
    Name = "${var.project_name}-${var.stack_name}-alb"
  }
}

resource "aws_lb_target_group" "front_end" {
  name     = "${var.project_name}-${var.stack_name}-lb-tg"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = var.ssl_certificate_id

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}