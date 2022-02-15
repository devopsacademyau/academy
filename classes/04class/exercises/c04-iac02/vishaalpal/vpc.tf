# Create local variable for subnet tagging
locals {
  subnet_ids = [for subnet in aws_subnet.subnets : subnet.id]
}

# Create vpc 
resource "aws_vpc" "vpc" {
  cidr_block = var.set_vpc_cidr_range

  tags = {
    Name     = "devopsacademy-iac"
    Student  = "Vishaal Pal"
    Exercise = "c04-iac02"
  }
}

# Create subnets 
resource "aws_subnet" "subnets" {
  for_each = var.subnets

  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.value["az"]
  cidr_block        = each.value["cidr"]

  tags = {
    Name     = "${each.value["name"]}"
    Student  = "Vishaal Pal"
    Exercise = "c04-iac02"
  }
}

# Create EIP
resource "aws_eip" "ngw-eip" {
  vpc = true

  tags = {
    Name     = "EIP for the NAT gateway"
    Student  = "Vishaal Pal"
    Exercise = "c04-iac02"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name     = "Internet gateway associated with - ${aws_vpc.vpc.id}"
    Student  = "Vishaal Pal"
    Exercise = "c04-iac02"
  }
}

# Create NAT gateway
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw-eip.id
  subnet_id     = local.subnet_ids[0]
  #subnet_id = [for subnet in aws_subnet.subnets : subnet.id][0]

  tags = {
    Name     = "NAT gateway residing in ${local.subnet_ids[0]}"
    Student  = "Vishaal Pal"
    Exercise = "c04-iac02"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

# Create a route table for the igw 
resource "aws_route_table" "route_table_igw" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name     = "Route table for the igw"
    Student  = "Vishaal Pal"
    Exercise = "c04-iac02"
  }
}

# Create a route table for the ngw
resource "aws_route_table" "route_table_ngw" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }

  tags = {
    Name     = "Route table for the ngw"
    Student  = "Vishaal Pal"
    Exercise = "c04-iac02"
  }
}

# Associate igw route table with public subnets
resource "aws_route_table_association" "public_route_assoc_public_subnet_01" {
  subnet_id      = local.subnet_ids[0]
  route_table_id = aws_route_table.route_table_igw.id
}

resource "aws_route_table_association" "public_route_assoc_public_subnet_02" {
  subnet_id      = local.subnet_ids[1]
  route_table_id = aws_route_table.route_table_igw.id
}

# Associate ngw route table with private subnets 
resource "aws_route_table_association" "private_route_assoc_private_subnet_03" {
  subnet_id      = local.subnet_ids[2]
  route_table_id = aws_route_table.route_table_ngw.id
}

resource "aws_route_table_association" "private_route_assoc_private_subnet04" {
  subnet_id      = local.subnet_ids[3]
  route_table_id = aws_route_table.route_table_ngw.id
}
