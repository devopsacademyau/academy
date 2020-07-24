data "aws_ami" "alinux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}


resource "aws_instance" "da_academy" {
  ami                         = "${data.aws_ami.alinux.id}"
  instance_type               = "t2.nano"
  iam_instance_profile        = "${aws_iam_instance_profile.DA_EC2_TO_S3_ROLE-InstanceProfile.name}"
  vpc_security_group_ids      = ["${aws_security_group.da-sg.id}"]
  availability_zone           = "ap-southeast-2a"
  associate_public_ip_address = true
  key_name                    = "kp_public"
  tags = {
    Name = "DevOpsAcademy-Instance"
  }
}
