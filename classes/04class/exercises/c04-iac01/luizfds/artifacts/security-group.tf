resource "aws_security_group" "allow_ssl" {
  name        = "DAC04IaC01-SG"
  description = "DAC04IaC01 Security Group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DAC04IaC01-SG"
  }
}