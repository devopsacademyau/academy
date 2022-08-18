##########################################################################################
# Define ALB
##########################################################################################
resource "aws_lb" "alb1" {
  name               = "contino-james-contino-james"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_lb.id]
  subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]

  depends_on = [
    aws_subnet.public_1,
    aws_subnet.public_2,
  ]
}

##########################################################################################
# Define ALB Target Group
##########################################################################################
resource "aws_lb_target_group" "tg" {
  name        = "TargetGroup"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id
}

##########################################################################################
# Define ALB Listener 
##########################################################################################
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb1.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

##########################################################################################
# Output for the ALB FQDN
##########################################################################################
output "alb_fqdn" {
  value = aws_lb.alb1.dns_name
}