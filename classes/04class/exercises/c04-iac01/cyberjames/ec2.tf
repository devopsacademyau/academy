# Get the latest Amazon linux 2 AMI ID from SSM Parameter Store
data "aws_ssm_parameter" "amzn2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# Create a network interface to attach to the EC2 instance
# Use default VPC and subnet
resource "aws_network_interface" "interface01" {
  subnet_id       = "subnet-19fd3a53"
  private_ips     = ["172.31.16.23"]
  security_groups = [aws_security_group.security_group.id]
  tags = {
    Name = "primary_network_interface"
  }
}

# Define a new resource of the EC2 instace type
resource "aws_instance" "instance01" {
  ami                  = data.aws_ssm_parameter.amzn2_ami.value
  instance_type        = "t1.micro"
  availability_zone    = "us-east-1a"
  key_name             = "contino-james-useast1"
  iam_instance_profile = aws_iam_instance_profile.iam_profile.name
  network_interface {
    network_interface_id = aws_network_interface.interface01.id
    device_index         = 0
  }
  tags = {
    Name = "c04-iac01-contino-james"
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
