resource "aws_security_group" "devops_c04_sg" {
  name        = "devops-c04-sg"
  description = "Devops-C04-SG Security Group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devopsacademy-c04-sg"
  }
}