#Load balancer for the web application
resource "aws_lb" "web_alb" {
  name               = "williamdaalb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.subnet_public_a.id, aws_subnet.subnet_public_b.id]

  enable_deletion_protection = false
}

# Target group for the ec2 instances
resource "aws_lb_target_group" "tg" {
  name     = "williamda-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

# Listener for front end of web app
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

output "alb_fqdn" {
  value = aws_lb.web_alb.dns_name
}