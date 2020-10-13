resource "aws_security_group" "httpd" {
  name = "ec2-${var.app_name}"
  description = "ec2 rules for ${var.app_name}"
  vpc_id = aws_vpc.main.id

  ingress {
    description = "allow port 80 http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb" {
  name = "alb-${var.app_name}"
  description = "allow http to alb ${var.app_name}"
  vpc_id = aws_vpc.main.id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
