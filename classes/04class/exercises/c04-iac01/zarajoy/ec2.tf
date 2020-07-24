resource aws_instance "ec2_default" {
  ami           = var.AMI_ID
  instance_type = var.EC2_INSTANCE_TYPE
  key_name      = var.KEY_NAME
  availability_zone  = var.AZ
  associate_public_ip_address = "true"
  iam_instance_profile = aws_iam_instance_profile.s3-ReadOnly-profile1.name
  security_groups  = [aws_security_group.C04-iac01-SG1.name] 
  
}
