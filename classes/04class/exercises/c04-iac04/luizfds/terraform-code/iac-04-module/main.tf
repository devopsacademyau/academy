# Declare the data source
data "aws_availability_zones" "available" {}

resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_launch_configuration" "autoscale_launch" {
  image_id        = "${lookup(var.aws_amis, var.aws_region)}"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.sec_web.id}"]
  key_name        = "${aws_key_pair.auth.id}"
  #  associate_public_ip_address = true
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get -y update
              sudo apt-get -y install nginx
              EOF
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "autoscale_group" {
  launch_configuration = "${aws_launch_configuration.autoscale_launch.id}"
  vpc_zone_identifier  = ["${aws_subnet.PrivateSubnetA.id}", "${aws_subnet.PrivateSubnetB.id}", "${aws_subnet.PrivateSubnetC.id}"]
  load_balancers       = ["${aws_elb.elb.name}"]
  min_size             = 3
  max_size             = 3
  tag {
    key                 = "Name"
    value               = "autoscale"
    propagate_at_launch = true
  }
}

resource "aws_security_group" "sec_web" {
  name        = "sec_web"
  description = "Used for autoscale group"
  vpc_id      = "${aws_vpc.default.id}"

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "sec_lb" {
  name   = "sec_elb"
  vpc_id = "${aws_vpc.default.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb" "elb" {
  name                      = "elb"
  security_groups           = ["${aws_security_group.sec_lb.id}"]
  subnets                   = ["${aws_subnet.PublicSubnetA.id}", "${aws_subnet.PublicSubnetB.id}", "${aws_subnet.PublicSubnetC.id}"]
  cross_zone_load_balancing = true
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:80/"
  }
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "80"
    instance_protocol = "http"
  }
}

resource "aws_lb" "alb" {
  name            = "alb"
  subnets         = ["${aws_subnet.PublicSubnetA.id}", "${aws_subnet.PublicSubnetB.id}", "${aws_subnet.PublicSubnetC.id}"]
  security_groups = ["${aws_security_group.sec_lb.id}"]
  internal        = false
  idle_timeout    = 60
  tags {
    Name = "alb"
  }
}

resource "aws_lb" "nlb" {
  name                             = "nlb"
  internal                         = false
  load_balancer_type               = "network"
  subnets                          = ["${aws_subnet.PublicSubnetA.id}", "${aws_subnet.PublicSubnetB.id}", "${aws_subnet.PublicSubnetC.id}"]
  enable_cross_zone_load_balancing = true
  tags {
    Name = "nlb"
  }
}

resource "aws_lb_target_group" "alb_target_group" {
  name     = "alb-target-group"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.default.id}"
  tags {
    name = "alb_target_group"
  }
  stickiness {
    type            = "lb_cookie"
    cookie_duration = 1800
    enabled         = true
  }
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/"
    port                = 80
  }
}

resource "aws_lb_target_group" "nlb_target_group" {
  name     = "nlb-target-group"
  port     = "80"
  protocol = "TCP"
  vpc_id   = "${aws_vpc.default.id}"
  tags {
    name = "nlb_target_group"
  }
}

resource "aws_autoscaling_attachment" "alb_autoscale" {
  alb_target_group_arn   = "${aws_lb_target_group.alb_target_group.arn}"
  autoscaling_group_name = "${aws_autoscaling_group.autoscale_group.id}"
}

resource "aws_autoscaling_attachment" "nlb_autoscale" {
  alb_target_group_arn   = "${aws_lb_target_group.nlb_target_group.arn}"
  autoscaling_group_name = "${aws_autoscaling_group.autoscale_group.id}"
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = "${aws_lb.alb.arn}"
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.alb_target_group.arn}"
    type             = "forward"
  }
}

resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = "${aws_lb.nlb.arn}"
  port              = 80
  protocol          = "TCP"

  default_action {
    target_group_arn = "${aws_lb_target_group.nlb_target_group.arn}"
    type             = "forward"
  }
}
