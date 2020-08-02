resource "aws_alb" "alb" {
  name               = "devops-academy-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_sg_id]
  subnets            = [var.pub_cidr_id_a, var.pub_cidr_id_b, var.pub_cidr_id_c]

  enable_deletion_protection = false

  tags = {
    Name = var.alb_name
  }
}

resource "aws_alb_target_group" "alb_tg" {
  name        = "devops-academy-alb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id
}

resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.alb_tg.arn
  }
}