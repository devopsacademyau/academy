resource "aws_instance" "mayu_c04_iac01" {
  ami                  = "ami-090fa75af13c156b4"
  instance_type        = "t2.micro"
  key_name             = "MayuKey"
  iam_instance_profile = aws_iam_instance_profile.S3Access_policy.id
  security_groups      = [aws_security_group.mayu_dojo_sg.name]
  depends_on = [
    aws_iam_role.EC2S3AccessRole
  ]

  tags = {
    Name = "mayu-c04-iac01"
  }
}

