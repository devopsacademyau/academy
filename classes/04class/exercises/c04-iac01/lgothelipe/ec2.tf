data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] # Amazon Linux free tier
  }
}

resource "aws_instance" "ec2-01" {
  ami           			= data.aws_ami.amazon.id
  instance_type 			= "t2.micro"
  security_groups 			= [aws_security_group.allow_ssh.name]
}