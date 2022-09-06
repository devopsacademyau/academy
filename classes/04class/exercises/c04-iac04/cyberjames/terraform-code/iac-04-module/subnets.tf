######################################################################
# Define VPC - Public Subnets
######################################################################
resource "aws_subnet" "public_1" {
  availability_zone = var.subnet_public1_az
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_pub_1_cidr
  tags = {
    Name = var.subnet_pub_1_name
  }
}

resource "aws_subnet" "public_2" {
  availability_zone = var.subnet_public2_az
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_pub_2_cidr
  tags = {
    Name = var.subnet_pub_2_name
  }
}

