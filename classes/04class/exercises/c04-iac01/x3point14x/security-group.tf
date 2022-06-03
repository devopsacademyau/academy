resource "aws_security_group" "bcurrey_iac_1_ssh_sg" {
  # https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs/resources/security_group  
  name = "bcurrey_iac_1_ssh_sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
}