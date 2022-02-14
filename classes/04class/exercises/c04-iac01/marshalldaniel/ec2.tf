resource "aws_instance" "iac01-marshalldaniel" {
  ami               = "ami-04fc979a55e14b094"
  instance_type     = "t3.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.marshalldaniel-sg-iac01.id]
  iam_instance_profile = aws_iam_instance_profile.marshalldaniel-profile.id
  subnet_id = "subnet-01b270057f65a803b"
  key_name = "marshalldaniel-test01"

  tags = {
    Name = "DevOpsAcademy-Instance-marshalldaniel"
  }
}
