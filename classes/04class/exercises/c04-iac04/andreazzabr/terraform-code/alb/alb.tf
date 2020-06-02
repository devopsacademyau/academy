resource "aws_lb" "lb" {
  name = "${var.projectname}-lb"
  internal = false
  load_balancer_type = "application"
  security_groups = var.asg_dependson
  subnets = flatten(var.publicsubnets_ids)
  tags = {
    Name = "${var.projectname}-lb"
  }
}
resource "aws_lb_listener" "lblistener" {
  load_balancer_arn = aws_lb.lb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.lbtg.arn
  }
}
resource "aws_lb_target_group" "lbtg" {
  name = "${var.projectname}-lb-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpcid
}