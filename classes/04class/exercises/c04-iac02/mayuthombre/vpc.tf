# create VPC
resource "aws_vpc" "tf-vpc" {
  cidr_block = var.vpcCIDRblock                      # calling out values from variables.tf
  tags = {
    Name = "devopsacademy-i"                          #tags for resoure grouping
  }
}

# Create public subnets 1 and public subnet 2
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)
  vpc_id                  = aws_vpc.tf-vpc.id                                     # reference to created VPC above
  cidr_block              = var.public_subnet_cidr_blocks[count.index]            # calling out values from variables.tf
  availability_zone       = var.availability_zones[count.index]                   # calling out values from variables.tf
  map_public_ip_on_launch = true                                                  # ensuring public subnet is created
  tags = {
    Name = var.public_subnet_names[count.index]
  }
}

# Create private subnets 1 and private subnet2
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)
  vpc_id            = aws_vpc.tf-vpc.id                                           # reference to created VPC above
  cidr_block        = var.private_subnet_cidr_blocks[count.index]                 # calling out values from variables.tf
  availability_zone = var.availability_zones[count.index]                         # calling out values from variables.tf
  tags = {
    Name = var.private_subnet_names[count.index]
  }
}


# Create Internet Gateway that will be attached to VPC
resource "aws_internet_gateway" "tf-igw" {
  vpc_id = aws_vpc.tf-vpc.id                                                      # reference to created VPC above
  tags = {
    Name = "devopsacademy-i"                                                      #tags for resoure grouping
  }
}

# Create Elastic IP that will be used by NAT gateway
resource "aws_eip" "nat" {
  vpc = true
  tags = {
    name = "devopsacademy-i"                                                      # tags for resoure grouping
  }
}

# Create NAT Gateway
resource "aws_nat_gateway" "tf-ngw" {
  subnet_id     = aws_subnet.public[0].id                                         # associating NAT gateway to public subnet
  allocation_id = aws_eip.nat.id                                                  # associating just created Elastic IP to NAT gateway
  tags = {
    Name = "devopsacademy-i"                                                      # tags for resoure grouping
  }
}

# Create Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.tf-vpc.id                                                      # reference to created VPC above
  tags = {
    Name = "devopsacademy-i"                                                      # tags for resoure grouping
  }
}

# Create route entries for public route table
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id                               # associating with above created public route table
  destination_cidr_block = var.destinationCIDRblock                                # calling out values from variables.tf
  gateway_id             = aws_internet_gateway.tf-igw.id                          # making an entry for internet gateway created above
}

# Associate the Route Table with the Public Subnets
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidr_blocks)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.tf-vpc.id                                                       # reference to created VPC above
  tags = {
    Name = "devopsacademy-i"                                                       # tags for resoure grouping
  }
}

# Create route for private route table
resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id                              # associating with above created private route table
  destination_cidr_block = var.destinationCIDRblock                                # calling out values from variables.tf
  nat_gateway_id         = aws_nat_gateway.tf-ngw.id                               # making an entry for NAT gateway created above
}

# Associate the Route Table with the Private Subnets
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_cidr_blocks)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}