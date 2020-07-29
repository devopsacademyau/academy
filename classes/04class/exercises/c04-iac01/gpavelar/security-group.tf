resource "aws_security_group" "first_terraform_security_group" {
  name   = "test terraform sg"
  vpc_id = "vpc-074c260483405f2bb"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/24"]
  }

  tags = {
    Name = "test terraform sg"
  }
}
