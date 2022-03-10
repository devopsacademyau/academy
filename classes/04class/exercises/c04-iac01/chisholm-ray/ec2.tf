resource "aws_instance" "this" {
  ami                    = "ami-042c4533fa25c105a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ssh.id]
  key_name               = "conorcr-kp"
  iam_instance_profile = aws_iam_instance_profile.this.name
}

