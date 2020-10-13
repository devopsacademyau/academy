resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "vpc-${var.app_name}"
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_a_cidr
  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "subnet-a-${var.app_name}"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_b_cidr
  availability_zone = "ap-southeast-2b"

  tags = {
    Name = "subnet-b-${var.app_name}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw-${var.app_name}"
  }
}

resource "aws_route_table" "pub_route" {
    vpc_id = aws_vpc.main.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "sub_a" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.pub_route.id
}

resource "aws_route_table_association" "sub_b" {
  subnet_id      = aws_subnet.subnet_b.id
  route_table_id = aws_route_table.pub_route.id
}

