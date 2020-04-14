# VPC
resource "aws_vpc" "devopsacademy_iac" {
  cidr_block = var.cidr_block

  tags = {
    "Name" = "devopsacademy_iac"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "da_igw" {
  vpc_id = aws_vpc.devopsacademy_iac.id

  tags = {
    "Name" = "Devops Academy IaC IGW"
  }
}

# Subnets : public
resource "aws_subnet" "public" {
  count = var.max_public_subnets
  vpc_id = aws_vpc.devopsacademy_iac.id
  cidr_block = cidrsubnet(var.cidr_block, 8, count.index * 2)
  map_public_ip_on_launch = true
	
  tags = {
    "Name" = var.public_subnet_name
  }
}

# Route table: attach Internet Gateway 
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.devopsacademy_iac.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.da_igw.id
  }
  tags = {
    Name = "Public RouteTable"
  }
}

# Route table association with public subnets
resource "aws_route_table_association" "public" {
  count 		 = var.max_public_subnets
  subnet_id      = element(aws_subnet.public.*.id,count.index)
  route_table_id = aws_route_table.public_rt.id
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  count = var.max_private_subnets
}

# NAT Gateway
resource "aws_nat_gateway" "da_ngw" {
  count 		 = var.max_private_subnets
  allocation_id  = element(aws_eip.nat.*.id,count.index)
  subnet_id 	 = element(aws_subnet.private.*.id,count.index)
  tags = {
    "Name" = "Devops Academy IaC NGW"
  }
}

# Subnets : private
resource "aws_subnet" "private" {
  count = var.max_private_subnets
  vpc_id = aws_vpc.devopsacademy_iac.id
  cidr_block = cidrsubnet(var.cidr_block, 8, count.index * 2 + 1)
  map_public_ip_on_launch = false
	
  tags = {
    "Name" = var.private_subnet_name
  }
}

# Route table: attach NAT Gateway 
resource "aws_route_table" "private_rt" {
  count = var.max_private_subnets
  vpc_id = aws_vpc.devopsacademy_iac.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = element(aws_nat_gateway.da_ngw.*.id,count.index)
  }
  tags = {
    Name = "Private RouteTable"
  }
}

# Route table association with private subnets
resource "aws_route_table_association" "private" {
  count 		 = var.max_private_subnets
  subnet_id      = element(aws_subnet.private.*.id,count.index)
  route_table_id = element(aws_route_table.private_rt.*.id,count.index)
}