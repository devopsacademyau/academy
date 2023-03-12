# Data for AWS AMI
data "aws_ami" "amznLinux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# Create an EC2 Instance
resource "aws_instance" "ec2" {
  ami                  = data.aws_ami.amznLinux.id
  instance_type        = "t2.micro"
  key_name             = "williamchrisp"
  security_groups      = ["${aws_security_group.sg.name}"]
  iam_instance_profile = "${aws_iam_instance_profile.ec2s3access.name}"

  tags = {
    Name = "williamDA"
  }
}

# EC2 Instance profile for s3 access
resource "aws_iam_instance_profile" "ec2s3access" {
  name = "ec2s3access"
  role = aws_iam_role.ec2s3role.name
}