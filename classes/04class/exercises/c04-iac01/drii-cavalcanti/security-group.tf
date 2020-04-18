resource "aws_security_group" "test_sg" {
  name = "allow_all"
  description = "Allow inbound SSH traffic from my IP"
  vpc_id = "vpc-b28e8bd5" 

  ingress {
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
