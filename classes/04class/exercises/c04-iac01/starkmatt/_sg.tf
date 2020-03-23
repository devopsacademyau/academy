resource "aws_security_group" "devops-sg-terra" {
  name        = "devops-sg-terra"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["110.174.100.211/32"]
  }

  tags = {
    Name = "devops-sg-terra"
}
