resource "aws_instance" "ec2" {
  ami           = "ami-0c641f2290e9cd048" // amazon linux 5.10 free tier avail
  instance_type = "t2.micro"
  key_name= var.key
  vpc_security_group_ids = [aws_security_group.ssh.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_role.id
  tags = {
    Name = var.tag
  }
}