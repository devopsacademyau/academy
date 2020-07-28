#
# VPC resources
#
resource "aws_vpc" "da_iac02_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    {
      Name        = var.name
        },
    var.tags
  )
}

resource "aws_internet_gateway" "da_iac02_igw" {
  vpc_id = aws_vpc.da_iac02_vpc.id

  tags = merge(
    {
      Name        = "gwInternet"
        },
    var.tags
  )
}

resource "aws_route_table" "private" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id = aws_vpc.da_iac02_vpc.id

  tags = merge(
    {
      Name        = "PrivateRouteTable"
                 },
    var.tags
  )
}

resource "aws_route" "private" {
  count = length(var.private_subnet_cidr_blocks)

  destination_cidr_block  = var.destination_cidr_block 
  route_table_id         = aws_route_table.private[count.index].id
   nat_gateway_id         = aws_nat_gateway.iac02nat[count.index].id
 }

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.da_iac02_vpc.id

  tags = merge(
    {
      Name        = "PublicRouteTable"
     },
    var.tags
  )
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
 #count = length(var.public_subnet_cidr_blocks)
  gateway_id             = aws_internet_gateway.da_iac02_igw.id
  #nat_gateway_id         = aws_nat_gateway.iac02nat.id
  destination_cidr_block  = var.destination_cidr_block 
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr_blocks)

  vpc_id            = aws_vpc.da_iac02_vpc.id
  cidr_block        = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    {
      Name        = "PrivateSubnet"
    },
    var.tags
  )
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidr_blocks)

  vpc_id                  = aws_vpc.da_iac02_vpc.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    {
      Name        = "PublicSubnet"
       },
    var.tags
  )
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr_blocks)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr_blocks)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}


#
# NAT resources
#
resource "aws_eip" "nat" {
  count = length(var.public_subnet_cidr_blocks)

  vpc = true
}

resource "aws_nat_gateway" "iac02nat" {
  depends_on = [aws_internet_gateway.da_iac02_igw]

  count = length(var.public_subnet_cidr_blocks)

  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = merge(
    {
      Name        = "iac02nat",
 
    },
    var.tags
  )
}

