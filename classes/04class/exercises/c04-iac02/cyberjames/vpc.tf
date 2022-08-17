######################################################################
# Define VPC
######################################################################
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = merge(
    {
      "Name" = var.vpc_name
    }
  )
}

######################################################################
# Define VPC - Public Subnets
######################################################################
resource "aws_subnet" "public_1" {
  availability_zone = var.subnet_pub_1_az
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_pub_1_cidr
  tags = merge(
    {
      "Name" = var.subnet_pub_1_name
    }
  )
}

resource "aws_subnet" "public_2" {
  availability_zone = var.subnet_pub_2_az
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_pub_2_cidr
  tags = merge(
    {
      "Name" = var.subnet_pub_2_name
    }
  )
}

######################################################################
# Define VPC - Private Subnets
######################################################################
resource "aws_subnet" "private_1" {
  availability_zone = var.subnet_prv_1_az
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_prv_1_cidr
  tags = merge(
    {
      "Name" = var.subnet_prv_1_name
    }
  )
}

resource "aws_subnet" "private_2" {
  availability_zone = var.subnet_prv_2_az
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_prv_2_cidr
  tags = merge(
    {
      "Name" = var.subnet_prv_2_name
    }
  )
}

######################################################################
# Define Internet Gateway for Public Subnets
######################################################################
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    {
      "Name" = var.internet_gateway_name
    }
  )
}

######################################################################
# Define the VPC NAT Gateway in Public Subnet
######################################################################
resource "aws_eip" "nat_gw_eip_1" {
  vpc = var.vpc_enabled
}

resource "aws_nat_gateway" "nat_gw_1" {
  allocation_id = aws_eip.nat_gw_eip_1.id
  subnet_id     = aws_subnet.private_1.id
  tags = merge(
    {
      "Name" = var.nat_gw_name_001
    }
  )
}

######################################################################
# Define Route Tables for Subnets to NAT Gateway and Internet Gateway
######################################################################
resource "aws_route_table" "internet_gateway_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.internet_cidr
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
}

resource "aws_route_table_association" "internet_gateway_rta_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.internet_gateway_rt.id
  depends_on = [
    aws_internet_gateway.internet_gateway
  ]
}

resource "aws_route_table_association" "internet_gateway_rta_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.internet_gateway_rt.id
  depends_on = [
    aws_internet_gateway.internet_gateway
  ]
}

resource "aws_route_table" "nat_gateway_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = var.internet_cidr
    nat_gateway_id = aws_nat_gateway.nat_gw_1.id
  }
  depends_on = [
    aws_nat_gateway.nat_gw_1
  ]
}

resource "aws_route_table_association" "nat-gateway-pub-1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.nat_gateway_rt.id
  depends_on = [
    aws_nat_gateway.nat_gw_1
  ]
}

resource "aws_route_table_association" "nat-gateway-pub-2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.nat_gateway_rt.id
  depends_on = [
    aws_nat_gateway.nat_gw_1
  ]
}
