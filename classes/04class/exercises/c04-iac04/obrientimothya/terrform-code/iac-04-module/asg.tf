locals {
  user_data = <<EOF
#!/bin/bash
yum update -y
yum install -y httpd
service httpd start
chkconfig httpd on
echo ${aws_alb.alb.dns_name} > /var/www/html/index.html
EOF
}
resource "aws_launch_template" "httpd" {
  name_prefix   = var.app_name
  image_id      = var.ami
  instance_type = "t2.micro"
  user_data     = base64encode(local.user_data)
  key_name      = "DevOpsAcademy"
  network_interfaces {
    security_groups = [aws_security_group.httpd.id]
    associate_public_ip_address = true
  }
}

resource "aws_autoscaling_group" "httpd" {
  name = "asg-${var.app_name}"

  vpc_zone_identifier = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]

  target_group_arns = [aws_alb_target_group.alb_tg.arn]

  max_size = var.max_size
  min_size = var.min_size
  desired_capacity = var.desired_capacity

  launch_template {
    id = aws_launch_template.httpd.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale-up-${var.app_name}"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.httpd.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down-${var.app_name}"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.httpd.name
}
