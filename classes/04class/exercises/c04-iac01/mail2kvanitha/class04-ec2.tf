resource "aws_instance" "class04-ec2" {
  ami = var.ec2_image_id
  instance_type = "t2.micro"
  key_name = aws_key_pair.class04-ec2-key.key_name
  vpc_security_group_ids = [aws_security_group.class04-sg.id]
  subnet_id = aws_subnet.class04-subnet.id
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.class04-iam-instance-profile.name
}
