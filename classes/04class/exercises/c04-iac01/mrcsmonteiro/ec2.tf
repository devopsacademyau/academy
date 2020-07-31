resource "aws_instance" "ec2" {
  ami                         = "ami-0a58e22c727337c51"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile_s3.name
  vpc_security_group_ids      = [aws_security_group.devops_academy_tf_sg.id]
  key_name                    = "DevOpsAcademy"

  tags = {
    Name = "DevOps-Academy-TF-Instance"
  }
}