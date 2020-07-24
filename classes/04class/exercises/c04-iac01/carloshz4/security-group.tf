resource "aws_security_group" "da-sg" {
  name = "da-sg"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  tags = {
    Name = "devopsacademy-sg"
  }

}

