# Define variables
variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "ami_id" {
    type = string
    default = "ami-0c641f2290e9cd048"
}

variable "key_name" {
    type = string 
    default = "kp-devops-academy"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_trust_role_1.name
}

resource "aws_instance" "ec2_c01_iac01" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
    tags = {
        Name = "c04-iac01"
    }
}