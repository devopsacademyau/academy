data "aws_availability_zones" "available" {
  state = "available"
}

resource aws_instance "aws-intance-c04-iac01" {
  ami                  = "ami-050e1ec030abb8dde"
  availability_zone    = data.aws_availability_zones.available.names[0]
  instance_type        = "t2.micro"
  security_groups      = [aws_security_group.my_securityGroup.name]
  iam_instance_profile = aws_iam_instance_profile.my_profile.name
  key_name             = "academy-key-pair"

  tags = {
    Name = "c04-iac01"
  }
}