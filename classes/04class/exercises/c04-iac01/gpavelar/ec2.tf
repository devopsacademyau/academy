resource "aws_instance" "test-ec2-instance" {
  ami             = "ami-0a58e22c727337c51"
  instance_type   = "t2.micro"
  key_name        = "devops-class"
  security_groups = [aws_security_group.first_terraform_security_group.id]

  tags = {
    Name = "test-terraform-instance"
  }

  # Same subnet from previous classes and exercises 
  subnet_id = "subnet-0f867dac87c7e75b4"
}
