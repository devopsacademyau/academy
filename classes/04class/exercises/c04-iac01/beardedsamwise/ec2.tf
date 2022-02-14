# Get the latest Amazon linux 2 AMI ID
data "aws_ami" "amzn2latest" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  owners = ["amazon"]
}

# Create a network interface to attach to the EC2 instance
# Use default VPC and subnet
resource "aws_network_interface" "interface01" {
  subnet_id       = "subnet-5d4a3934"
  private_ips     = ["172.31.16.100"]
  security_groups = [aws_security_group.sg.id]
  tags = {
    Name = "primary_network_interface"
  }
}

# Define a new resource of the EC2 instace type
resource "aws_instance" "instance01" {
  ami                  = data.aws_ami.amzn2latest.id
  instance_type        = "t1.micro"
  availability_zone    = "ap-southeast-2a"
  key_name             = "ContinoDojo"
  iam_instance_profile = aws_iam_instance_profile.iam_profile.name
  network_interface {
    network_interface_id = aws_network_interface.interface01.id
    device_index         = 0
  }
  tags = {
    Name = "c04-iac01"
  }
}

# Define a new resource of the EIP type
resource "aws_eip" "eip01" {
  vpc = true
}

# Associate an EC2 instance resource with a EIP resource
resource "aws_eip_association" "eip01" {
  instance_id   = aws_instance.instance01.id
  allocation_id = aws_eip.eip01.id
}
