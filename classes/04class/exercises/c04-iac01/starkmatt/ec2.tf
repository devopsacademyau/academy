resource aws_instance "ze_academy" {
  ami                    = "ami-08fdde86b93accf1c"
  availability_zone      = "ap-southeast-2a"
  instance_type          = "t1.micro"
  security_groups        = [aws_security_group.devops-sg-terra.name]
  iam_instance_profile   = aws_iam_role.S3-ReadOnly.name
  key_name               = "starkmatt-box"

  tags = {
    Name = "devops-ec2-terraform"
  }
}
