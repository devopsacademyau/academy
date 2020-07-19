locals {
  vpc_cidr = "192.168.0.0/16"
}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "example" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}

resource "aws_vpc" "devops_academy" {
  cidr_block = local.vpc_cidr
  tags = {
    Name = "DevopsAcademy"
  }
}
resource "aws_subnet" "subnet_private_a" {
  vpc_id            = aws_vpc.devops_academy.id
  cidr_block        = cidrsubnet(local.vpc_cidr, 8, 10)
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "private-a"
  }
}
resource "aws_subnet" "subnet_private_b" {
  vpc_id            = aws_vpc.devops_academy.id
  cidr_block        = cidrsubnet(local.vpc_cidr, 8, 20)  # check other built-in functions https://www.terraform.io/docs/configuration/functions.html
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "private-b"
  }
}
resource "aws_subnet" "subnet_public_a" {
  vpc_id            = aws_vpc.devops_academy.id
  cidr_block        = cidrsubnet(local.vpc_cidr, 8, 100)
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "public-a"
  }
}
resource "aws_subnet" "subnet_public_b" {
  vpc_id            = aws_vpc.devops_academy.id
  cidr_block        = cidrsubnet(local.vpc_cidr, 8, 200)
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "public-b"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.devops_academy.id
  tags = {
    Name = "DevOpsAcademy-IGW"
  }
}
resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.devops_academy.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "PublicRoutingTable"
  }
}
resource "aws_route_table_association" "route_public_a" {
  subnet_id      = aws_subnet.subnet_public_a.id
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "route_public_b" {
  subnet_id      = aws_subnet.subnet_public_b.id
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_instance" "da_academy" {
  ami           = data.aws_ami.example.id
  subnet_id     = aws_subnet.subnet_public_b.id
  instance_type = "t2.micro"

  tags = {
    Name = "DevOpsAcademy-Instance"
  }
}

## You can also add a NAT gateway as below
# resource "aws_eip" "natgw_a" {
#   vpc = true
# }

# resource "aws_nat_gateway" "gw_a" {
#   allocation_id = aws_eip.natgw_a.id
#   subnet_id     = aws_subnet.subnet_public_a.id
#   tags = {
#     Name = "NATGW-A"
#   }
# }

# resource "aws_route_table" "route_table_private" {
#   vpc_id = aws_vpc.devops_academy.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.gw_a.id
#   }
#   tags = {
#     Name = "PrivateRoutingTable"
#   }
# }

# resource "aws_route_table_association" "route_private_a" {
#   subnet_id      = aws_subnet.subnet_private_a.id
#   route_table_id = aws_route_table.route_table_private.id
# }
# resource "aws_route_table_association" "route_private_b" {
#   subnet_id      = aws_subnet.subnet_private_b.id
#   route_table_id = aws_route_table.route_table_private.id
# }