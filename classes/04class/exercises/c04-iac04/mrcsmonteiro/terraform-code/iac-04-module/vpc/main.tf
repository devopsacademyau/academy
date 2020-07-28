resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "pub_cidr_a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub_cidr_a
  availability_zone       = var.az_a
  map_public_ip_on_launch = true

  tags = {
    Name = var.pub_name_a
  }
}

resource "aws_subnet" "pub_cidr_b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub_cidr_b
  availability_zone       = var.az_b
  map_public_ip_on_launch = true

  tags = {
    Name = var.pub_name_b
  }
}

resource "aws_subnet" "pub_cidr_c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub_cidr_c
  availability_zone       = var.az_c
  map_public_ip_on_launch = true

  tags = {
    Name = var.pub_name_c
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.pub_rt_name
  }
}

resource "aws_route_table_association" "pub_subnet_a" {
  subnet_id      = aws_subnet.pub_cidr_a.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pub_subnet_b" {
  subnet_id      = aws_subnet.pub_cidr_b.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pub_subnet_c" {
  subnet_id      = aws_subnet.pub_cidr_c.id
  route_table_id = aws_route_table.pub_rt.id
}