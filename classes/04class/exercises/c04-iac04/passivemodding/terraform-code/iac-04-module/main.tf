# launch config for instances, creates index.html and host it with apache (httpd)
resource "aws_launch_template" "this" {
  # image is amd linux 5.0
  image_id        = var.ami_image_id

  # used for ssh into the instance
  key_name = var.key_pair

  instance_type = "t2.micro"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [
        aws_security_group.instance.id
    ]
  }

  # 169.254.169.254 are access to the instance metadata service
  # Read: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html
  user_data = base64encode(<<EOF
#! /bin/bash
yum update -y
yum install -y httpd
curl 169.254.169.254/latest/meta-data/hostname >> index.html
mv index.html /var/www/html/
systemctl start httpd
    EOF
  )

  lifecycle {
    create_before_destroy = true
  }
}

# connect asg to target group
resource "aws_autoscaling_attachment" "this" {
  autoscaling_group_name = aws_autoscaling_group.this.id
  lb_target_group_arn   = aws_lb_target_group.this.arn
}