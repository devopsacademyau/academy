resource "aws_security_group" "C04-iac01-SG1" {
  name        = "C04-iac01-SG1"
  
    ingress {
    from_port   = var.FROMPORT
    to_port     = var.TOPORT
    protocol    = var.PROTOCOL
    cidr_blocks = var.MYIP
  }

}
