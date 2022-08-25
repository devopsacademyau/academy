# Pulling AZ available
data "aws_availability_zones" "available" {
  state = "available"
}

# Creating VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "williamDA"
  }
}

# Create 2 private Subnets across two different AZs
resource "aws_subnet" "subnet_private_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet1_private_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = var.subnet1_private_name
  }
}
resource "aws_subnet" "subnet_private_b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet2_private_cidr
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = var.subnet2_private_name
  }
}
resource "aws_subnet" "subnet_public_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet1_public_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = var.subnet1_public_name
  }
}
resource "aws_subnet" "subnet_public_b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet2_public_cidr
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = var.subnet2_public_name
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "williamda-IGW"
  }
}
resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "PublicRoutingTable"
  }
}
resource "aws_route_table_association" "route_public_a" {
  subnet_id      = aws_subnet.subnet_public_a.id
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "route_public_b" {
  subnet_id      = aws_subnet.subnet_public_b.id
  route_table_id = aws_route_table.route_table_public.id
}


# You can also add a NAT gateway as below
resource "aws_eip" "natgw_a" {
  vpc = true
}

resource "aws_nat_gateway" "gw_a" {
  allocation_id = aws_eip.natgw_a.id
  subnet_id     = aws_subnet.subnet_public_a.id
  tags = {
    Name = "NATGW-A"
  }
}

resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw_a.id
  }
  tags = {
    Name = "PrivateRoutingTable"
  }
}

resource "aws_route_table_association" "route_private_a" {
  subnet_id      = aws_subnet.subnet_private_a.id
  route_table_id = aws_route_table.route_table_private.id
}
resource "aws_route_table_association" "route_private_b" {
  subnet_id      = aws_subnet.subnet_private_b.id
  route_table_id = aws_route_table.route_table_private.id
}