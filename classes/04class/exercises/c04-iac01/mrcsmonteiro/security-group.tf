resource "aws_security_group" "devops_academy_tf_sg" {
  name        = "devops-academy-tf-sg"
  description = "Allow SSH traffic"

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
    Name = "DevOps Academy TF SG"
  }
}