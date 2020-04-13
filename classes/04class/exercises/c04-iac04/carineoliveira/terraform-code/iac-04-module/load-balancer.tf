resource "aws_alb" "my_load_balancer" {
  load_balancer_type = "application"
  name               = "my-load-balancer"
  subnets            = data.aws_subnet_ids.my_subnet_ids.ids
  security_groups    = data.aws_security_groups.my_security_groups.ids

  tags = {
    Name = "c04-iac04"
  }
}

# resource "aws_lb_target_group_attachment" "my_load_balance_target_group_attachment" {
#   target_group_arn = "${aws_lb_target_group.my_target_group.arn}"
#   target_id        =  ????? //aws_autoscaling_group.my_auto_scaling_group.instance_id //"${aws_instance.test.id}"
#   port             = 80
# }