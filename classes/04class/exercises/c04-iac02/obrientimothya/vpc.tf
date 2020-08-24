# VPC

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "vpc-${var.app_name}"
  }
}

# SUBNETS

resource "aws_subnet" "pvt1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_pvt_cidr_1

  tags = {
    Name = var.subnet_pvt_name_1
  }
}

resource "aws_subnet" "pvt2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_pvt_cidr_2

  tags = {
    Name = var.subnet_pvt_name_2
  }
}

resource "aws_subnet" "pub1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_pub_cidr_1

  tags = {
    Name = var.subnet_pub_name_1
  }
}

resource "aws_subnet" "pub2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_pub_cidr_2

  tags = {
    Name = var.subnet_pub_name_2
  }
}

# IGW

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw-${var.app_name}"
  }
}

# NGW

# eip for ngw
resource "aws_eip" "ngw_eip" {
  vpc = true
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw_eip.id
  subnet_id     = aws_subnet.pvt1.id

  tags = {
    Name = "ngw-${var.app_name}"
  }
}

# ROUTES

# public - direct to IGW
resource "aws_route_table" "pub_route" {
    vpc_id = aws_vpc.main.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }
}

# private - via NAT
resource "aws_route_table" "pvt_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }
}

# RT ASSOC

resource "aws_route_table_association" "pub1" {
  subnet_id      = aws_subnet.pub1.id
  route_table_id = aws_route_table.pub_route.id
}
resource "aws_route_table_association" "pub2" {
  subnet_id      = aws_subnet.pub2.id
  route_table_id = aws_route_table.pub_route.id
}

resource "aws_route_table_association" "pvt1" {
  subnet_id      = aws_subnet.pvt1.id
  route_table_id = aws_route_table.pvt_route.id
}
resource "aws_route_table_association" "pvt2" {
  subnet_id      = aws_subnet.pvt2.id
  route_table_id = aws_route_table.pvt_route.id
}

