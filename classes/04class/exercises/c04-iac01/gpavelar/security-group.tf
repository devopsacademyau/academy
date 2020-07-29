resource "aws_security_group" "first_terraform_security_group" {
  name        = "test terraform sg"
  description = "Allow SSH traffic"
  vpc_id      = "vpc-074c260483405f2bb"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["120.159.93.15/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "test terraform sg"
  }
}
