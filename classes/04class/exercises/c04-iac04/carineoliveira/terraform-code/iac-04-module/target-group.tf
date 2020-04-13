resource "aws_lb_target_group" "my_target_group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
}

resource "aws_autoscaling_attachment" "my_autoscaling_attachment" {
  autoscaling_group_name = "${aws_autoscaling_group.my_auto_scaling_group.id}"
  alb_target_group_arn   = "${aws_lb_target_group.my_target_group.arn}"
}


