data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] # Amazon Linux free tier
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.s3_read_only.name
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.amazon.id
  instance_type = "t2.micro"
  key_name = "Christina AWS"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "Devops_iac01_ec2"
  }
}