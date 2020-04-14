resource "aws_instance" "c04-iac01" {
  ami           = "ami-02a599eb01e3b3c5b"
  instance_type = "t2.micro"
  availability_zone    = "ap-southeast-2a"
  iam_instance_profile = aws_iam_instance_profile.s3-access-pr.name
  security_groups      = [aws_security_group.c04-iac1-sg.name]

  tags = {
    Name = "First EC2 Instance"
  }
}
