resource "aws_security_group" "mayu_dojo_sg" {
  name        = "mayu_dojo_sg"
  description = "Allow SSH traffic on port 22"


  tags = {
    type = "mayu-dojo-exercise"
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

