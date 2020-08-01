resource "aws_instance" "ec2" {
  ami           = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_pair
  vpc_security_group_ids      = [aws_security_group.sg_allow_ssh.id]
  subnet_id     = var.subnet_id
  associate_public_ip_address = "true"
  iam_instance_profile = aws_iam_instance_profile.S3readOnly.name
}