resource "aws_instance" "ec2_default" {
  ami           = var.ec2_image_id
  instance_type = var.ec2_instance_type
  key_name      = var.key_pair_name
  vpc_security_group_ids = [
    aws_security_group.sg_allow_ssh.id
  ]
  subnet_id            = aws_subnet.subnet_devops.id
  iam_instance_profile = aws_iam_instance_profile.s3_readonly.name

  tags = merge(var.common_tags, {
    "Name" = "EC2 Instance - ${var.devops_class}"
  })
}