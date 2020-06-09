# Declare the data source
data "aws_availability_zones" "available" {}

data "aws_vpc" "default" {
  id = "${var.vpc_id}"
}

data "aws_subnet" "subnet_a" {
  id = "${var.subnets[0]}"
}

data "aws_subnet" "subnet_b" {
  id = "${var.subnets[1]}"
}

data "aws_subnet" "subnet_c" {
  id = "${var.subnets[2]}"
}

# Security Groups
resource "aws_security_group" "sec_web" {
  name        = "sec_web"
  description = "Used for autoscale group"
  vpc_id      = "${data.aws_vpc.default.id}"

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

resource "aws_security_group" "sec_alb" {
  name   = "sec_alb"
  vpc_id = "${data.aws_vpc.default.id}"

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

# AWS key pair
# resource "aws_key_pair" "auth" {
#   key_name   = "${var.key_name}"
#   public_key = "${file(var.public_key_path)}"
# }

data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] # Amazon Linux free tier
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# AWS launch configuration
resource "aws_launch_configuration" "autoscale_launch" {
  image_id        = "${data.aws_ami.amazon.id}"
  instance_type   = "${var.instance_type}"
  security_groups = ["${aws_security_group.sec_web.id}"]
  # key_name                    = "${aws_key_pair.auth.id}"
  associate_public_ip_address = true
  user_data                   = <<EOF
    #! /bin/bash
    yum update -y
    yum install -y httpd
    echo Welcome to the end of exercise c04-iac04 > index.html
    mv index.html /var/www/html/
    systemctl start httpd
 EOF
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_elb" "elb" {
  name                      = "elb"
  security_groups           = ["${aws_security_group.sec_alb.id}"]
  subnets                   = ["${data.aws_subnet.subnet_a.id}", "${data.aws_subnet.subnet_b.id}", "${data.aws_subnet.subnet_c.id}"]
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
  subnets         = ["${data.aws_subnet.subnet_a.id}", "${data.aws_subnet.subnet_b.id}", "${data.aws_subnet.subnet_c.id}"]
  security_groups = ["${aws_security_group.sec_alb.id}"]
  internal        = false
  idle_timeout    = 60
  tags = {
    Name = "alb"
  }
}

resource "aws_autoscaling_group" "autoscale_group" {
  launch_configuration = "${aws_launch_configuration.autoscale_launch.id}"
  vpc_zone_identifier  = ["${data.aws_subnet.subnet_a.id}", "${data.aws_subnet.subnet_b.id}", "${data.aws_subnet.subnet_c.id}"]
  load_balancers       = ["${aws_elb.elb.name}"]
  min_size             = var.min_size
  max_size             = var.max_size
  tag {
    key                 = "Name"
    value               = "autoscale"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "asg_policy_increase" {
  name                   = "asg-policy-increase"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.autoscale_group.name
}

resource "aws_autoscaling_policy" "asg_policy_decrease" {
  name                   = "asg-policy-decrease"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.autoscale_group.name
}

resource "aws_lb_target_group" "alb_target_group" {
  name     = "alb-target-group"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${data.aws_vpc.default.id}"
  tags = {
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

resource "aws_autoscaling_attachment" "alb_autoscale" {
  alb_target_group_arn   = "${aws_lb_target_group.alb_target_group.arn}"
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
