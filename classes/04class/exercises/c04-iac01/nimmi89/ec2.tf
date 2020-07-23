# Create a EC2 instance
resource "aws_instance" "da-instance" {
  ami = "ami-088ff0e3bde7b3fdf"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.DA-sg.id]
  key_name = "C01-AWS01KeyPair"
 
  tags = {
     Name = "DA-Instance-Terraform"
 }
 
  iam_instance_profile = aws_iam_instance_profile.test_profile.name
 
}
# Get the public ip to ssh into the instance
output "instance_ip_addr" {
  value = aws_instance.da-instance.public_ip
}
