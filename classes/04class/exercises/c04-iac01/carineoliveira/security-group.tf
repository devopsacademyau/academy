 resource "aws_security_group" "my_securityGroup" {
  name = "my_securityGroup"
  description = "Security group for Terraform (class 4 exercise IAC 1)"
  ingress {
    description = "SSH access port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "c04-iac01"
  }
}