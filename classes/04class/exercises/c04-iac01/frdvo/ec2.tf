# Define a new resource of the EC2 instace type
resource "aws_instance" "da_academy" {
  ami               = "ami-088ff0e3bde7b3fdf"
  availability_zone = "ap-southeast-2a"
  instance_type     = "t2.micro"
  iam_instance_profile = "ec2-read-s3-role-tf-profile"
  subnet_id = "subnet-04843486979b4aeb2"
  vpc_security_group_ids      = [aws_security_group.da-allow_ssh-tf.id]
  associate_public_ip_address = true
  key_name = "da"
  tags = {
    Name = "DevOps_Academy_Terraform_1st_EC2"
  }
}