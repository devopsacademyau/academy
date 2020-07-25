resource "aws_security_group" "da-allow_ssh-tf" {
  name        = "da-allow_ssh-tf"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-0a2b7db4956438d22"

  ingress {
    description = "SSH from Home"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["122.199.35.116/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}