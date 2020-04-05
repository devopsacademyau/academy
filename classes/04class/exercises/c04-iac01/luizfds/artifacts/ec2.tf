resource "aws_instance" "DAC04IaC01_ec2" {
  ami = "ami-08fdde86b93accf1c"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.allow_ssl.name}"]
  iam_instance_profile = "${aws_iam_instance_profile.s3_read_only_profile.name}"
  key_name = "devopsacademy"

  tags = {
    Name = "DAC04IaC01-Instance"
  }
}