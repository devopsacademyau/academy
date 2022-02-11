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

# resource "aws_lb_listener" "front_end" {
#   load_balancer_arn = aws_lb.alb1.arn
#   port              = "80"
#   protocol          = "HTTP"
#   default_action {
    # ADD TARGET GROUP
#   }
# }