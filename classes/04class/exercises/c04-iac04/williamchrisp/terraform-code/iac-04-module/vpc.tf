# Pulling AZ available
data "aws_availability_zones" "available" {
  state = "available"
}

# Creating VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "williamda"
  }
}

# Create 2 private Subnets across two different AZs
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
