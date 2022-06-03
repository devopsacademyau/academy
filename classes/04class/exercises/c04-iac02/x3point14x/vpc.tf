// VPC
# https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs/resources/vpc
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    tags = {
      "Name" = "devopsacademy-iac"
    }
}

// Subnets
# https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs/data-sources/subnet
resource "aws_subnet" "private_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnets.priv_subnet_1.cidr
  tags = {
    "Name" = var.private_subnets.priv_subnet_1.name
  }

}

resource "aws_subnet" "private_2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnets.priv_subnet_2.cidr
  tags = {
    "Name" = var.private_subnets.priv_subnet_2.name
  }

}

resource "aws_subnet" "public_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnets.pub_subnet_1.cidr
  tags = {
    "Name" = var.public_subnets.pub_subnet_1.name
  }

}

resource "aws_subnet" "public_2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnets.pub_subnet_2.cidr
  tags = {
    "Name" = var.public_subnets.pub_subnet_2.name
  }

}

// Internet Gateway
# https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs/resources/internet_gateway
resource "aws_internet_gateway" "inet_gw" {
    vpc_id = aws_vpc.vpc.id
}

// NAT gateway
# https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs/resources/nat_gateway
resource "aws_nat_gateway" "nat_gw" {
    subnet_id = aws_subnet.private_1.id
    connectivity_type = "private"
  
}

// Route Tables
# https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs/data-sources/route_table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.vpc.id
}

//Routes 
# https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs/resources/route
resource "aws_route" "private" {
    route_table_id = aws_route_table.private.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
}

resource "aws_route" "public" {
    route_table_id = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.inet_gw.id
  
}

// Route table associations
# https://registry.terraform.io/providers/hashicorp/aws/4.16.0/docs/resources/route_table_association
# Private
resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}

# Public
resource "aws_route_table_association" "public_1" {
    subnet_id = aws_subnet.public_1.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
    subnet_id = aws_subnet.public_2.id
    route_table_id = aws_route_table.public.id
}