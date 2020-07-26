resource "aws_instance" "bastion" {
  ami                    = "ami-0a58e22c727337c51"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.devops_academy_sg.id]
  subnet_id              = aws_subnet.devops_academy_iac_public_subnet_1.id
  key_name               = "DevOpsAcademy"

  tags = {
    Name = "DevOps Academy Public Instance"
  }
}

resource "aws_instance" "private" {
  ami           = "ami-0a58e22c727337c51"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.devops_academy_iac_private_subnet_1.id
  key_name      = "DevOpsAcademy"

  tags = {
    Name = "DevOps Academy Private Instance"
  }
}