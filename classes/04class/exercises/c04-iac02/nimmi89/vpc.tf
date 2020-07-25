# Create VPC/Subnet/Security Group/Network ACL

#VPC
resource "aws_vpc" "tf-vpc" {
  cidr_block       = var.vpcCIDRblock
  tags = {
    Name = "devopsacademy-i"
  }
}


#Public subnets -1 and 2
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
        Name = var.public_subnet_names[count.index]
    }
}

#Private subnets -1 and 2
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = var.private_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  tags = {
        Name = var.private_subnet_names[count.index]
    }
}


#Internet Gateway attached to VPC
resource "aws_internet_gateway" "tf-igw" {
 vpc_id = aws_vpc.tf-vpc.id
 tags = {
        Name = "devopsacademy-igw"
  }
}


#NAT Gateway
resource "aws_eip" "nat" {
    vpc = true
}

resource "aws_nat_gateway" "tf-ngw" {
 subnet_id     = aws_subnet.public[0].id
 allocation_id = aws_eip.nat.id
 tags = {
        Name = "devopsacademy-ngw"
  }
} 

#Public Route Table
resource "aws_route_table" "public" {
 vpc_id = aws_vpc.tf-vpc.id
 tags = {
        Name = "devopsacademy-rt-public"
 }
}

#Create route for public route table
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = var.destinationCIDRblock
  gateway_id             = aws_internet_gateway.tf-igw.id
}

# Associate the Route Table with the Public Subnets
resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr_blocks)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}


#Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.tf-vpc.id
  tags = {
        Name = "devopsacademy-rt-private"
  }
}

#Create route for private route table
resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = var.destinationCIDRblock
  nat_gateway_id             = aws_nat_gateway.tf-ngw.id
}

# Associate the Route Table with the Private Subnets
resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr_blocks)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

