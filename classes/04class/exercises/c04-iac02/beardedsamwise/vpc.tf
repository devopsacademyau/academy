# Create VPC 
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "c04-iac02"
  }
}

# Create private subnets
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet1_private_cidr

  tags = {
    Name = var.subnet1_private_name
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet2_private_cidr

  tags = {
    Name = var.subnet2_private_name
  }
}

# Create public subnets
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet1_public_cidr

  tags = {
    Name = var.subnet1_public_name
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet2_public_cidr

  tags = {
    Name = var.subnet2_public_name
  }
}

# Create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "c04-iac02"
  }
}

# Create route table for the public subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "c04-iac02-public"
  }
}

# Create route table for the private subnets
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw.id
  }

  tags = {
    Name = "c04-iac02-private"
  }
}

# Assosciate route table with public subnets
resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

# Assosciate route table with private subnets
resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}

# Create NAT gateway
resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public1.id

  tags = {
    Name = "c04-iac02"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}

# Generate outputs
output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}
output "private_subnet1" {
  value = aws_subnet.private1.cidr_block
}
output "private_subnet2" {
  value = aws_subnet.private2.cidr_block
}
output "public_subnet1" {
  value = aws_subnet.public1.cidr_block
}
output "public_subnet2" {
  value = aws_subnet.public2.cidr_block
}