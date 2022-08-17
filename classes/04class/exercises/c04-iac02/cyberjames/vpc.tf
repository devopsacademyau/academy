######################################################################
# Create VPC
######################################################################
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

######################################################################
# Create VPC - Public Subnets
######################################################################
resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_pub_1_cidr

  tags = {
    Name = var.subnet_pub_1_name
  }
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_pub_2_cidr

  tags = {
    Name = var.subnet_pub_2_name
  }
}

######################################################################
# Create VPC - Private Subnets
######################################################################
resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_prv_1_cidr

  tags = {
    Name = var.subnet_prv_1_name
  }
}

resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_prv_2_cidr

  tags = {
    Name = var.subnet_prv_2_name
  }
}

######################################################################
# Create Internet Gateway for Public Subnets
######################################################################
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.internet_gateway_name
  }
}

######################################################################
# Create Route Tables for Public Subnets
######################################################################
resource "aws_route_table" "internet_gateway_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = var.igw_rt_pub_name
  }
}

resource "aws_route_table_association" "internet_gateway_rta_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.internet_gateway_rt.id

  # To ensure proper ordering, recommeded adding explicit dependency
  # on Internet Gateway for the VPC.
  depends_on = [
    aws_internet_gateway.internet_gateway
  ]
}

resource "aws_route_table_association" "internet_gateway_rta_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.internet_gateway_rt.id

  # To ensure proper ordering, recommeded adding explicit dependency
  # on Internet Gateway for the VPC.
  depends_on = [
    aws_internet_gateway.internet_gateway
  ]
}

######################################################################
# Create the VPC NAT Gateway
######################################################################
resource "aws_eip" "nat_gw_eip" {
  vpc = var.vpc_enabled
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.private_1.id

  tags = {
    Name = var.nat_gw_name
  }
}

######################################################################
# Create Route Tables for Private Subnets
######################################################################
resource "aws_route_table" "nat_gateway_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  # To ensure proper ordering, recommeded adding explicit dependency
  # on NAT Gateway for the VPC.
  depends_on = [
    aws_nat_gateway.nat_gw
  ]

  tags = {
    Name = var.nat_gateway_rt_name
  }
}

resource "aws_route_table_association" "nat-gw-prv-1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.nat_gateway_rt.id

  # To ensure proper ordering, recommeded adding explicit dependency
  # on NAT Gateway for the VPC.
  depends_on = [
    aws_nat_gateway.nat_gw
  ]
}

resource "aws_route_table_association" "nat-gw-prv-2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.nat_gateway_rt.id

  # To ensure proper ordering, recommeded adding explicit dependency
  # on NAT Gateway for the VPC.
  depends_on = [
    aws_nat_gateway.nat_gw
  ]
}
