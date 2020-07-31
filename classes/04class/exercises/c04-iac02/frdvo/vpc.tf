# VPC devopsacademy_iac
resource "aws_vpc" "devopsacademy_iac_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "devopsacademy_iac"
  }
}

# 4 Subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.devopsacademy_iac_vpc.id
  cidr_block        = var.subnets.public_subnet_1.cidr
  
  tags = {
    Name = var.subnets.public_subnet_1.name
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.devopsacademy_iac_vpc.id
  cidr_block        = var.subnets.public_subnet_2.cidr
  
  tags = {
    Name = var.subnets.public_subnet_2.name
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.devopsacademy_iac_vpc.id
  cidr_block        = var.subnets.private_subnet_1.cidr
  
  tags = {
    Name = var.subnets.private_subnet_1.name
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.devopsacademy_iac_vpc.id
  cidr_block        = var.subnets.private_subnet_2.cidr
  
  tags = {
    Name = var.subnets.private_subnet_2.name
  }
}

# Internet GW attached to your VPC
resource "aws_internet_gateway" "devopsacademy_iac_vpc_gw" {
  vpc_id = aws_vpc.devopsacademy_iac_vpc.id

  tags = {
    Name = "devopsacademy_iac_vpc_igw"
  }
}

# NAT GW
resource "aws_eip" "devopsacademy_iac_nat_eip" {

  tags = {
    Name = "devopsacademy_iac_nat_eip"
  }
}

resource "aws_nat_gateway" "devopsacademy_iac_vpc_nat_gw" {
  allocation_id = aws_eip.devopsacademy_iac_nat_eip.id
  subnet_id     = aws_subnet.private_subnet_1.id
   tags = {
    Name = "devopsacademy_iac_vpc_nat_gw"
  }
}

# Routing tables for the subnets be able to communicate witht he internet
# Public
resource "aws_route_table" "devopsacademy_iac_vpc_public_rt" {
  vpc_id = aws_vpc.devopsacademy_iac_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devopsacademy_iac_vpc_gw.id
  }

  tags = {
    Name = "devopsacademy_iac_vpc_public_rt"
  }
}

# Private
resource "aws_route_table" "devopsacademy_iac_vpc_private_rt" {
  vpc_id = aws_vpc.devopsacademy_iac_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.devopsacademy_iac_vpc_nat_gw.id
  }
  tags = {
    Name = "devopsacademy_iac-vpc-private-rt"
  }
}

# Route Table Association
# Public
resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.devopsacademy_iac_vpc_public_rt.id
}

resource "aws_route_table_association" "public_subnet_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.devopsacademy_iac_vpc_public_rt.id
}



# Private
resource "aws_route_table_association" "private_subnet_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.devopsacademy_iac_vpc_private_rt.id
}

resource "aws_route_table_association" "private_subnet_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.devopsacademy_iac_vpc_private_rt.id
}