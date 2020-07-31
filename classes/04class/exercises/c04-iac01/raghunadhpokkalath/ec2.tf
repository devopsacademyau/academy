resource "aws_instance" "ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = "EC2KeyPair"
  security_groups             = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.this.name
  tags = {
    Name = "devops-academy-ec2"
  }
}