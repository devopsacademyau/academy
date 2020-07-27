resource "aws_instance" "devopsc04_ec2" {
  ami                  = "ami-0a58e22c727337c51"
  instance_type        = "t2.micro"
  security_groups      = ["${aws_security_group.devops_c04_sg.name}"]
  iam_instance_profile = "${aws_iam_instance_profile.devopsc04_profile.name}"
  key_name             = "DevopsAcademy"

  tags = {
    Name = "devopsc04_ec2"
  }
}