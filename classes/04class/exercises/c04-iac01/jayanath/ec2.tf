data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "doa-ec2" {
  ami                         = data.aws_ami.amazon-linux-2.id
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.doa_ec2_runner_instance_profile.id
  instance_type               = "t2.micro"
  key_name                    = var.key_pair
  vpc_security_group_ids      = [aws_security_group.sg_allow_ssh.id]
  subnet_id                   = var.public_subnet_id
}