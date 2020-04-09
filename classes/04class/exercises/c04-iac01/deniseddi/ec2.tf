# Define a new resource of the EC2 instace type
resource "aws_instance" "da-ec2-instance" {
  ami                  = "ami-08fdde86b93accf1c"
  availability_zone    = "ap-southeast-2c"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.test-profile.name
  security_groups      = [aws_security_group.da-sg-test.name]

  tags = {
    Name = "da-ec2-instance"
  }
}
