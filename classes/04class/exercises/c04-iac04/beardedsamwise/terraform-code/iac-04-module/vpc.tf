# Create VPC 
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "c04-iac04"
  }
}

# Create subnets
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet1_cidr
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "c04-iac04_subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet2_cidr
  availability_zone = "ap-southeast-2b"

  tags = {
    Name = "c04-iac04_subnet2"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "gw1" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "c04-iac04"
  }
}

# Create NAT gateway
resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.subnet1.id

  tags = {
    Name = "c04-iac02"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw1]
}

# Create route table for the subnets
resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw.id
  }

  tags = {
    Name = "c04-iac02"
  }
}

# Assosciate route table with public subnets
resource "aws_route_table_association" "subnet1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt1.id
}

resource "aws_route_table_association" "subnet2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt1.id
}


