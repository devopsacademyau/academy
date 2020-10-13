# Internet VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

# Subnets
resource "aws_subnet" "main-public" { 
  for_each                = var.public_subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = "true"
  availability_zone       = each.value.zone

  tags = {
    Name = "${var.project_name}-${each.key}"
  }
}


resource "aws_subnet" "main-private" { 
  for_each                = var.private_subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = "true"
  availability_zone       = each.value.zone

  tags = {
    Name = "${var.project_name}-${each.key}"
  }
}


# Internet GW
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-gw"
  }
}

# route tables
resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }

  tags = {
    Name = "${var.project_name}-rt-public"
  }
}

# route associations public
resource "aws_route_table_association" "main-public" {
  for_each       = aws_subnet.main-public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.main-public.id
}


resource "aws_route_table" "main-private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    Name = "${var.project_name}-rt-private"
  }
}

 
# route associations private
resource "aws_route_table_association" "main-private" {
  for_each       = aws_subnet.main-private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.main-private.id
}


# nat gw
resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = values(aws_subnet.main-private)[0].id
  depends_on    = [aws_internet_gateway.main-gw]

  tags = {
      Name = "${var.project_name}-nat-gw"
  }
}

