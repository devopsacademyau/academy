resource "aws_instance" "devopsec2" {
  ami           = "ami-08fdde86b93accf1c"
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_role.roles3read.name
  security_groups = [aws_security_group.allow_ssh.name]
}