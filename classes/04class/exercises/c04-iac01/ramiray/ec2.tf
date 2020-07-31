resource "aws_instance" "role-test" {
  ami                  = "ami-0a58e22c727337c51"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.myec2_instance_profile.name
  key_name             = "Devopsacademy"
vpc_security_group_ids = [aws_security_group.da_exercise_sg.id]
tags = {
    Name = "dalinuxserver"
  }

} 

