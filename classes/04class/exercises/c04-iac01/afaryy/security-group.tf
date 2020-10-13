resource "aws_security_group" "instance_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow inbound ssh traffic from own ip and all egress traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Inbound SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      var.your_home_network_cidr
     ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}