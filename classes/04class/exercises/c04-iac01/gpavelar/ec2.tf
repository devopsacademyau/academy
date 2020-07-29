resource "aws_instance" "test-ec2-instance" {
  ami                         = "ami-0a58e22c727337c51"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  key_name                    = "devops-class"
  iam_instance_profile        = aws_iam_instance_profile.terraform_instance_profile.name
  security_groups             = [aws_security_group.first_terraform_security_group.id]

  tags = {
    Name = "test-terraform-instance"
  }

  # Same subnet from previous classes and exercises 
  subnet_id = "subnet-0f867dac87c7e75b4"
}
