# Get the latest Ubuntu AMI ID 
data "aws_ami" "ami" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

# Create an elastic network interface
resource "aws_network_interface" "eni" {
  subnet_id       = "subnet-0b9ea22221a94add7"
  security_groups = [aws_security_group.sg.id]

  # Apply tags to resource 
  tags = {
    Name     = "ec2-instance-eni"
    Student  = "Vishaal Pal"
    Exercise = "c04-iac01"
  }
}

# Create the EC2 instance
resource "aws_instance" "c04-iac01" {
  ami                  = data.aws_ami.ami.id
  instance_type        = "t2.micro"
  key_name             = "c04-iac01"
  iam_instance_profile = aws_iam_instance_profile.iam_instance_profile.id

  network_interface {
    network_interface_id = aws_network_interface.eni.id
    device_index         = 0
  }

  # Apply tags to resource
  tags = {
    Name     = "c04-iac01"
    Student  = "Vishaal Pal"
    Exercise = "c04-iac01"
  }
}

# Create an elastic IPv4 address
resource "aws_eip" "eip" {
  instance = aws_instance.c04-iac01.id #
  vpc      = true

  # Apply tags to resource
  tags = {
    Name     = "ec2-instance-eip"
    Student  = "Vishaal Pal"
    Exercise = "c04-iac01"
  }
}

# Create an eip association
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.c04-iac01.id
  allocation_id = aws_eip.eip.id
}

