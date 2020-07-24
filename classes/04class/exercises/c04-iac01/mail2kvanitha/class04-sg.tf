resource "aws_security_group" "class04-sg" {
  name        = "class04-sg"
  description = "Class04 Security Group"
  vpc_id      = aws_vpc.class04-vpc.id

  ingress {
    description = "Allow SSH Connectivity"
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

  tags = {
    Name = "class04-sg"
  }
}
