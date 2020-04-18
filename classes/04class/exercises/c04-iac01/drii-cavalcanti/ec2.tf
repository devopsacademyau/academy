resource "aws_instance" "da_academy" {
  ami               = "ami-08fdde86b93accf1c"	
  instance_type     = "t2.micro"
  associate_public_ip_address = "true"
  key_name = "sydney-key-pair"
  security_groups = ["allow_all"]

  tags = {
    Name = "DevOpsAcademy-EC2"
  }
}
