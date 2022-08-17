# vps main
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "devopsacademy-iac"
  }
}

# init public subnets
resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_public_1_cidr

  tags = {
    Name = var.subnet_public_1_name
  }
}

resource "aws_subnet" "public2" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnet_public_2_cidr

  tags = { 
    Name = var.subnet_public_2_name
  }
}

# init private subnets
resource "aws_subnet" "private1" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnet_private_1_cidr

  tags = { 
    Name = var.subnet_private_1_name
  }
}

resource "aws_subnet" "private2" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnet_private_2_cidr

  tags = { 
    Name = var.subnet_private_2_name
  }
}

# init internet gateway, connect to vpc
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.main.id
}

# setup eip for the nat gateway to use
resource "aws_eip" "ip" {
  vpc      = true
}

# nat gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.ip.id
  subnet_id     = aws_subnet.public1.id

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gateway]
}

# route tables
resource "aws_route_table" "public_routes" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
}

resource "aws_route_table" "private_routes" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
}

# connect subnets to route table
resource "aws_route_table_association" "public1" {
  subnet_id = aws_subnet.public1.id
  route_table_id = aws_route_table.public_routes.id
}

resource "aws_route_table_association" "public2" {
  subnet_id = aws_subnet.public2.id
  route_table_id = aws_route_table.public_routes.id
}

resource "aws_route_table_association" "private1" {
  subnet_id = aws_subnet.private1.id
  route_table_id = aws_route_table.private_routes.id
}

resource "aws_route_table_association" "private2" {
  subnet_id = aws_subnet.private2.id
  route_table_id = aws_route_table.private_routes.id
}