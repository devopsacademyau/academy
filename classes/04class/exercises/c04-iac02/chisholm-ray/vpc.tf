# locals {

#   networks_priv = toset(flatten([for subnet_name, values in var.subnet_mappings_priv: [{
#                             subnet_name = subnet_name
#                             cidr = values.cidr
#                             az  = values.az
#                             }]     
                            
#                          ]))
                   
# }

# data "aws_availability_zones" "this" {  
# }

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "devopsacademy-iac-ccr"
  }
}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.main.id 
}

resource "aws_subnet" "private_1" {
  vpc_id = aws_vpc.main.id
  
  cidr_block = var.subnet_mappings_priv.subnet_1.cidr
  availability_zone = var.subnet_mappings_priv.subnet_1.az

  tags = {
    "Name" = "${var.subnet_mappings_priv.subnet_1.name}-ccr"
    "Type" = "Private"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id = aws_vpc.main.id
  
  cidr_block = var.subnet_mappings_priv.subnet_2.cidr
  availability_zone = var.subnet_mappings_priv.subnet_2.az

  tags = {
    "Name" = "${var.subnet_mappings_priv.subnet_2.name}-ccr"
    "Type" = "Private"
  }
}

resource "aws_subnet" "public_1" {
  vpc_id = aws_vpc.main.id
  
  cidr_block = var.subnet_mappings_pub.subnet_1.cidr
  availability_zone = var.subnet_mappings_pub.subnet_1.az

  tags = {
    "Name" = "${var.subnet_mappings_pub.subnet_1.name}-ccr"
    "Type" = "Private"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id = aws_vpc.main.id
  
  cidr_block = var.subnet_mappings_pub.subnet_2.cidr
  availability_zone = var.subnet_mappings_pub.subnet_2.az

  tags = {
    "Name" = "${var.subnet_mappings_pub.subnet_2.name}-ccr"
    "Type" = "Private"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.private.id
          }
  
  tags = {
    "Name" = "CCR-Private-routeTable"
    "Type" = "Private"
  }
} 


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.public.id
  }
    tags = {
    "Name" = "CCR-Public-ALL-routeTable"
    "Type" = "Public"
  }  
}

resource "aws_route_table_association" "private_1" {
    depends_on = [
      aws_route_table.private,
      aws_subnet.private_1
    ]
  subnet_id = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
    depends_on = [
      aws_route_table.private,
      aws_subnet.private_2
    ]
  subnet_id = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public_1" {
    depends_on = [
      aws_route_table.public,
      aws_subnet.public_1
    ]
  subnet_id = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
    depends_on = [
      aws_route_table.public,
      aws_subnet.public_2
    ]
  subnet_id = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_nat_gateway" "private" {
    depends_on = [
      aws_subnet.private_1
    ]
  subnet_id = aws_subnet.private_1.id
  connectivity_type = "private"
  tags = {
    "Name" = "CCR-Private-NatGateway"
    "Type" = "Private"
  }
  
}


