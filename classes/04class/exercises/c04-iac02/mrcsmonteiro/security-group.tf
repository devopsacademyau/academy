resource "aws_security_group" "devops_academy_sg" {
  name        = "devops-academy-sg"
  description = "Allow SSH traffic"
  vpc_id      = aws_vpc.devops_academy_iac_vpc.id

  ingress {
    description = "Allow SSH for Admin only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["220.253.7.163/32"]
  }

  egress {
    description = "Allow ALL outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DevOps Academy SG"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.devops_academy_iac_vpc.id

  ingress {
    description = "Allow SSH traffic from DevOps Academy VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.20.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DevOps Academy Default SG"
  }
}