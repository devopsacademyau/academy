# group to define port 22 access for ssh and allowing all outbound traffic
resource "aws_security_group" "ssh" {
  name        = "lj_c04_iac01_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description      = "SSH port"
    cidr_blocks      = ["0.0.0.0/0"]
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  tags = {
    Name = var.tag
  }
}