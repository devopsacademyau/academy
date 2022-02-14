resource "aws_security_group" "marshalldaniel-sg-iac01" {
  name        = "marshalldaniel-sg-iac01"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-0d91d246cabb35035"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
