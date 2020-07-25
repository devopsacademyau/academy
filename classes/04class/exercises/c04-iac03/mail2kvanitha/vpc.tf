provider "aws" {
  region                  = "ap-southeast-2"
}

data "aws_availability_zones" "az" {
  state = "available"
}

resource "aws_vpc" "devopsacademy-iac" {
  cidr_block = var.vpc-cidr
  enable_dns_hostnames = true

  tags = {
    Name = "devopsacademy-iac"
  }
}

resource "aws_internet_gateway" "devopsacademy-iac-igw" {
  vpc_id = aws_vpc.devopsacademy-iac.id

  tags = {
    Name = "devopsacademy-iac-igw"
  }
}

resource "aws_eip" "devopsacademy-iac-eip" {
  vpc = true
}

resource "aws_subnet" "iac-public-1a" {
  availability_zone = data.aws_availability_zones.az.names[0]
  cidr_block = var.public-subnet-1a
  vpc_id = aws_vpc.devopsacademy-iac.id
  map_public_ip_on_launch = "true"

  tags = {
    Name = "iac-public-1a"
  }
}

resource "aws_subnet" "iac-public-1b" {
  availability_zone = data.aws_availability_zones.az.names[1]
  cidr_block = var.public-subnet-1b
  vpc_id = aws_vpc.devopsacademy-iac.id
  map_public_ip_on_launch = "true"

  tags = {
    Name = "iac-public-1b"
  }
}

resource "aws_subnet" "iac-private-1a" {
  availability_zone = data.aws_availability_zones.az.names[0]
  cidr_block = var.private-subnet-1a
  vpc_id = aws_vpc.devopsacademy-iac.id
  map_public_ip_on_launch = "true"

  tags = var.private-subnet-1a-tags
}

resource "aws_subnet" "iac-private-1b" {
  availability_zone = data.aws_availability_zones.az.names[1]
  cidr_block = var.private-subnet-1b
  vpc_id = aws_vpc.devopsacademy-iac.id
  map_public_ip_on_launch = "true"

  tags = var.private-subnet-1a-tags
}

resource "aws_nat_gateway" "iac-nat-gateway" {
  allocation_id = aws_eip.devopsacademy-iac-eip.id
  subnet_id = aws_subnet.iac-public-1a.id
  tags = {
    Name = "iac-nat-gateway"
  }
}

resource "aws_route_table" "iac-public-rt" {
  vpc_id = aws_vpc.devopsacademy-iac.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devopsacademy-iac-igw.id
  } 
  tags = {
     Name = "iac-public-rt" 
  }
}

resource "aws_route_table_association" "iac-pub1a-rtassoc" {
  subnet_id = aws_subnet.iac-public-1a.id
  route_table_id = aws_route_table.iac-public-rt.id
}

resource "aws_route_table_association" "iac-pub1b-rtassoc" {
  subnet_id = aws_subnet.iac-public-1b.id
  route_table_id = aws_route_table.iac-public-rt.id
}

resource "aws_route_table" "iac-private-rt" {
  vpc_id = aws_vpc.devopsacademy-iac.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.iac-nat-gateway.id
    }
   tags = {
      Name = "iac-private-rt"
    }
}

resource "aws_route_table_association" "iac-prv1a-rtassoc" {
  subnet_id = aws_subnet.iac-private-1a.id
  route_table_id = aws_route_table.iac-private-rt.id
}

resource "aws_route_table_association" "iac-prv1b-rtassoc" {
  subnet_id = aws_subnet.iac-private-1b.id
  route_table_id = aws_route_table.iac-private-rt.id
}

resource "aws_main_route_table_association" "iac-main-rtassoc" {
  vpc_id         = aws_vpc.devopsacademy-iac.id
  route_table_id = aws_route_table.iac-public-rt.id
}

