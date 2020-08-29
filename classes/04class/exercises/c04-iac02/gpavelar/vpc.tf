##
# VPC
#
resource "aws_vpc" "devopsacademy-iac" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

##
# Internet Gateway
#
resource "aws_internet_gateway" "c04-iac-igw" {
  vpc_id = aws_vpc.devopsacademy-iac.id

  tags = {
    Name = var.igw-name
  }
}

##
# Subnets
#

resource "aws_subnet" "private-subnet" {
  count             = length(var.subnets_cidrs_private)
  vpc_id            = aws_vpc.devopsacademy-iac.id
  cidr_block        = var.subnets_cidrs_private[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "${var.subnets_names_private[count.index]}"
  }

  depends_on = [aws_vpc.devopsacademy-iac]
}

resource "aws_subnet" "public-subnet" {
  count                   = length(var.subnets_cidrs_public)
  vpc_id                  = aws_vpc.devopsacademy-iac.id
  cidr_block              = var.subnets_cidrs_public[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.azs[count.index]

  tags = {
    Name = "${var.subnets_names_public[count.index]}"
  }

  depends_on = [aws_vpc.devopsacademy-iac]
}

##
# NAT Gateway
#
resource "aws_eip" "eip-nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat-1" {
  count = 1
  ## Required to not get AuthFailure errors. According to: Terraform Documentation
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = aws_subnet.public-subnet[count.index].id

  tags = {
    Name = var.nat-name
  }
}

##
#  Allow internet access
#
resource "aws_route_table" "devopsacademy-iac-rt" {
  vpc_id = aws_vpc.devopsacademy-iac.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.c04-iac-igw.id
  }

  tags = {
    Name = var.rt-iac
  }
}

resource "aws_route_table" "devopsacademy-iac-rt-private" {
  count = 1
  vpc_id = aws_vpc.devopsacademy-iac.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-1[count.index].id
  }

  tags = {
    Name = var.rt-iac-private
  }
}

##
# Route Table Associations
#
resource "aws_route_table_association" "public" {
  count = length(var.subnets_cidrs_public)

  subnet_id      = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.devopsacademy-iac-rt.id
}

resource "aws_route_table_association" "private" {
  count = length(var.subnets_cidrs_private)

  subnet_id      = aws_subnet.private-subnet[count.index].id
  route_table_id = aws_route_table.devopsacademy-iac-rt-private[0].id
}