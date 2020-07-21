resource "aws_security_group" "sg_allow_ssh" {
  name        = "SG for Devops ${var.devops_class}"
  description = "Allow SSH connection"
  vpc_id      = aws_vpc.vpc_devops.id

  ingress {
    description = "Allow SSH from ip address"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.sg_allowed_ip_addresses
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    "Name" = "allow-ssh-sg"
  })
}