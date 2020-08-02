resource "aws_launch_template" "devops" {
  name_prefix   = "devops"
  image_id      = var.image_id
  instance_type = "t2.micro"
  key_name      = var.key_pair

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.allow_internet.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.common_tags, {
      Name = "${var.devops_class}-instance"
    })
  }

  user_data = base64encode(<<EOF
#! /bin/bash
yum update -y
yum install -y httpd
curl 169.254.169.254/latest/meta-data/hostname >> index.html
mv index.html /var/www/html/
systemctl start httpd
    EOF
  )
}

resource "aws_lb" "devops" {
  name               = "devops-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.allow_internet.id
  ]
  subnets = var.lb_subnets

  tags = merge(var.common_tags, {
    Name = "${var.devops_class}-lb"
  })
}


resource "aws_autoscaling_group" "devops" {
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1
  vpc_zone_identifier = var.lb_subnets

  launch_template {
    id      = aws_launch_template.devops.id
    version = "$Latest"
  }
}

resource "aws_lb_target_group" "devops" {
  name     = "${var.devops_class}-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    interval = 200
  }
}

resource "aws_autoscaling_attachment" "devops" {
  autoscaling_group_name = aws_autoscaling_group.devops.id
  alb_target_group_arn   = aws_lb_target_group.devops.arn
}

resource "aws_lb_listener" "devops" {
  load_balancer_arn = aws_lb.devops.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.devops.arn
  }
}