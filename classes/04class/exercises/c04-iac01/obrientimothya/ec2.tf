resource "aws_instance" "ec2_instance" {
  ami                         = "ami-0c3a4ad3dbe082a72" # let's give ARM a go ;-)
  instance_type               = "a1.medium"
  key_name                    = "devopsacademy-keypair"
  security_groups             = [aws_security_group.ec2_allow_ssh.id]
  iam_instance_profile        = aws_iam_instance_profile.s3_instance_profile.name
  associate_public_ip_address = true
  subnet_id                   = "subnet-0c7d4b07b3f1df4b8"
}
