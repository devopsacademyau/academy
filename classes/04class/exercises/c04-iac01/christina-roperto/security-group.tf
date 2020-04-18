 resource "aws_security_group" "Devops_iac01" {
  name = "Devops_iac01"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name = "Devops_iac01_sg"
  }
}
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.Devops_iac01.id
  network_interface_id = aws_instance.ec2.primary_network_interface_id
}