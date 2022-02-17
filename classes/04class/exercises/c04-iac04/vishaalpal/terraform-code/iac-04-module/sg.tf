# Security group for an application load balancer
resource "aws_security_group" "alb_sg" {
  name        = "${var.project_name}_alb security group"
  description = "This security group controls traffic on a ALB."
  vpc_id      = var.vpc_id

  ingress {
    description = "allow_http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Author = "Vishaal Pal"
    Name   = "${var.project_name}_alb security group"
  }
}

# Security group for instances in private subnets
resource "aws_security_group" "private_instance_sg" {
  name        = "${var.project_name}_private instance security group"
  description = "This security group controls traffic on private EC2 instances."
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.alb_sg.id}"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Author = "Vishaal Pal"
    Name   = "${var.project_name}_private instance security group"
  }
}

