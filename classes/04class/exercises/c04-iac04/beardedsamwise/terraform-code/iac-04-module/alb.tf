# Create ALB (Application Load Balancer)
resource "aws_lb" "alb1" {
  name               = "c04-iac04-sam"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_lb.id]
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  depends_on = [
    aws_subnet.subnet1,
    aws_subnet.subnet2,
  ]
  }

# Create ALB Target Group
resource "aws_lb_target_group" "tg" {
  name        = "TargetGroup"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
}

# Create ALB Listener 
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb1.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# Output ALB FQDN
output "alb_fqdn" {
  value = aws_lb.alb1.dns_name
}