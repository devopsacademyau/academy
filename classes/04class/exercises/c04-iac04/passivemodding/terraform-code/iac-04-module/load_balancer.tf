# routes traffic at the application layer
resource "aws_lb" "this" {
  name               = "lb"
  internal           = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.load_balancer.id
  ]
  subnets = var.public_asg_subnets
}

# targets http traffic on the vpc
resource "aws_lb_target_group" "this" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    interval = 200
  }
}

# specified how to handle any HTTP requests on port 80
# forwards all requests to the load balancer to the target group
resource "aws_lb_listener" "devops" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}