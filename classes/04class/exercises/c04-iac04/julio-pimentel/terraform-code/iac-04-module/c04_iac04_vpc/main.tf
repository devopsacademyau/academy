#VPC
resource "aws_vpc" "vpc_1" {
  cidr_block = var.vpc_cidr
  enable_dns_support = "true" #
  enable_dns_hostnames = "true" #

  tags = {
    Name = var.vpc_name
  }
}

#Public subnets
resource "aws_subnet" "pub_sub_1" {
  vpc_id = aws_vpc.vpc_1.id
  cidr_block = var.pub_sub_cidr_1
  availability_zone = var.az_a
  map_public_ip_on_launch = true

  tags = {
    Name = var.pub_sub_name_1
  }
}

resource "aws_subnet" "pub_sub_2" {
  vpc_id = aws_vpc.vpc_1.id
  cidr_block = var.pub_sub_cidr_2
  availability_zone = var.az_b
  map_public_ip_on_launch = true

  tags = {
    Name = var.pub_sub_name_2
  }
}

resource "aws_subnet" "pub_sub_3" {
  vpc_id = aws_vpc.vpc_1.id
  cidr_block = var.pub_sub_cidr_3
  availability_zone = var.az_c
  map_public_ip_on_launch = true

  tags = {
    Name = var.pub_sub_name_3
  }
}

#Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_1.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.pub_rt_name
  }
}

#Associated route tables
resource "aws_route_table_association" "pub_subnet_1" {
  subnet_id = aws_subnet.pub_sub_1.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pub_subnet_2" {
  subnet_id = aws_subnet.pub_sub_2.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_route_table_association" "pub_subnet_3" {
  subnet_id = aws_subnet.pub_sub_3.id
  route_table_id = aws_route_table.pub_rt.id
}