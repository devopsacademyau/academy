# Main VPC 
resource "aws_vpc" "devopsacademy_iac" {
  cidr_block = var.cidr_vpc
  enable_dns_hostnames = "true"
  tags = {
    Name = "devopsacademy-iac"
  }
}

data "aws_availability_zones" "az_available" {
  state = "available"
}

# Create public subnets 
resource "aws_subnet" "c04_iac02_public_1" {
  vpc_id                  = aws_vpc.devopsacademy_iac.id
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = "true" #public ip address
  cidr_block              = var.subnet_cidr_public_1

  tags = {
    Name = var.subnet_name_public_1
  }
}

resource "aws_subnet" "c04_iac02_public_2" {
  vpc_id                  = aws_vpc.devopsacademy_iac.id
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = "true"
  cidr_block              = var.subnet_cidr_public_2

  tags = {
    Name = var.subnet_name_public_2
  }
}

# Create private subnets
resource "aws_subnet" "c04_iac02_private_1" {
  vpc_id            = aws_vpc.devopsacademy_iac.id
  availability_zone = "ap-southeast-2a"
  cidr_block        = var.subnet_cidr_private_1

  tags = {
    Name = var.subnet_name_private_1
  }
}

resource "aws_subnet" "c04_iac02_private_2" {
  vpc_id            = aws_vpc.devopsacademy_iac.id
  availability_zone = "ap-southeast-2b"
  cidr_block        = var.subnet_cidr_private_2

  tags = {
    Name = var.subnet_cidr_private_2
  }
}

#Create internet gateway 
resource "aws_internet_gateway" "c04_iac02_igw" {
  vpc_id = aws_vpc.devopsacademy_iac.id
  tags = {
    Name = "c04-iac02-igw"
  }
}

# Create nat gateway
resource "aws_eip" "c04_iac02_eip" {
  vpc = true
}

resource "aws_nat_gateway" "c04_iac02_ngw" {
  allocation_id = aws_eip.c04_iac02_eip.id
  subnet_id = aws_subnet.c04_iac02_public_1.id
  depends_on = [aws_internet_gateway.c04_iac02_igw]
  tags = {
    Name = "c04-iac02-ngw"
  }
}

#Create route tables 
resource "aws_route_table" "c04_iac02_rt_public" {
  vpc_id = aws_vpc.devopsacademy_iac.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.c04_iac02_igw.id
  }

  tags = {
    Name = "c04-iac02-rt-public"
  }
}

resource "aws_route_table" "c04_iac02_rt_private" {
  vpc_id = aws_vpc.devopsacademy_iac.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.c04_iac02_ngw.id
  }
  tags = {
    Name = "c04-iac02-rt-private"
  }
}

# Associate public route tables 
resource "aws_route_table_association" "c04_iac02_rt_assoc_public_1" {
  subnet_id      = aws_subnet.c04_iac02_public_1.id
  route_table_id = aws_route_table.c04_iac02_rt_public.id
}

resource "aws_route_table_association" "c04_iac02_rt_assoc_public_2" {
  subnet_id      = aws_subnet.c04_iac02_public_2.id
  route_table_id = aws_route_table.c04_iac02_rt_public.id
}

# Associate private route tables 
resource "aws_route_table_association" "c04_iac02_rt_assoc_private_1" {
  subnet_id      = aws_subnet.c04_iac02_private_1.id
  route_table_id = aws_route_table.c04_iac02_rt_private.id
}

resource "aws_route_table_association" "c04_iac02_rt_assoc_private_2" {
  subnet_id      = aws_subnet.c04_iac02_private_2.id
  route_table_id = aws_route_table.c04_iac02_rt_private.id
}