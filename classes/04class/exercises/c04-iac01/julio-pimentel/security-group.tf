 resource "aws_security_group" "c04_iac01_sg" {
  name = "c04_iac01_sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    name = "c04-iac01"
  }
}
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.c04_iac01_sg.id
  network_interface_id = aws_instance.ec2_c01_iac01.primary_network_interface_id
}