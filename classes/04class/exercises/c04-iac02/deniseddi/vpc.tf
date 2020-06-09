# VPC 
resource "aws_vpc" "devopsacademy-iac" {
  cidr_block = var.cidr_block
  tags = {
    Name = "devopsacademy-iac"
  }
}

# Availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Two public subnets 
resource "aws_subnet" "public" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.devopsacademy-iac.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index * 2)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${data.aws_availability_zones.available.names[count.index]
    }"
  }
}

# Two private subnets 
resource "aws_subnet" "private" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.devopsacademy-iac.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index * 2 + 1)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = "private-subnet-${data.aws_availability_zones.available.names[count.index]
    }"
  }
}

#Interent Gateway
resource "aws_internet_gateway" "da-igw" {
  vpc_id = aws_vpc.devopsacademy-iac.id
  tags = {
    "Name" = "da-igw"
  }
}

# Elastic IP
resource "aws_eip" "da-eip" {
  vpc = true
}

# NAT Gateway
resource "aws_nat_gateway" "da-nat-gw" {
  allocation_id = aws_eip.da-eip.id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = "da-nat-gw"
  }
}

# Route Table -IGW
resource "aws_route_table" "da-rt-public" {
  vpc_id = aws_vpc.devopsacademy-iac.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.da-igw.id
  }
  tags = {
    Name = "da-rt-public"
  }
}

# Route table association - public subnets
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.da-rt-public.id
}

# Route table - NAT gateway
resource "aws_route_table" "da-rt-private" {
  vpc_id = aws_vpc.devopsacademy-iac.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.da-nat-gw.id
  }
  tags = {
    Name = "da-rt-private"
  }
}

# Route table association - private subnets
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.da-rt-private.id
}




