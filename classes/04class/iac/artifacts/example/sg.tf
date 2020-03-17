resource "aws_security_group" "security_group" {
  name        = "test sg"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/24"]
  }

  tags = {
    Name = "test sg"
  }
}