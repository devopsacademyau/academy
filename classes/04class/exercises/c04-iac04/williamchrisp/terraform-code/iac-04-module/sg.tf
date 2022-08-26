# Create security group to allow SSH
resource "aws_security_group" "lb_sg" {
  name = "williamDA_lb_sg"
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "williamDA_lb_sg"
  }
}

resource "aws_security_group" "ec2_sg" {
  name = "williamDA_ec2_sg"
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "williamDA_ec2_sg"
  }
}