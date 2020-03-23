resource "aws_instance" "ze_academy" {
  ami                    = "ami-08fdde86b93accf1c"
  availability_zone      = "ap-southeast-2a"
  instance_type          = "t1.micro"
  security_groups        = ["devops-sg-terra"]
  iam_instance_profile   = "S3-FullAccess"
  key_name               = "starkmatt-box"

  tags = {
    Name = "devops-ec2-terraform"
  }
}

