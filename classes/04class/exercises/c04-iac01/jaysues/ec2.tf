data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"] # Amazon Linux free tier
  }
}

resource "aws_instance" "ec2-web" {
  ami             = data.aws_ami.amazon.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.allow_ssh.name]
  key_name        = data.aws_key_pair.ssh_key.key_name
  tags = {
    Name = "ec2-start"
  }
}

data "aws_key_pair" "ssh_key" {
  key_name = "ec2-starter-key"
  #   public_key = file(var.public_key_location)
}
