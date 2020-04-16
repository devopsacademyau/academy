resource "aws_vpc" "main" {
    cidr_block = var.vpc-cidr
    enable_dns_hostnames = true
}
resource "aws_subnet" "public-subs" {
    vpc_id = aws_vpc.main.id
  count = length(var.publicsubnets)
  cidr_block = var.publicsubnets[count.index].cidr
  availability_zone = var.publicsubnets[count.index].az
  map_public_ip_on_launch = var.publicsubnets[count.index].publicip
  tags = {
     Name = var.publicsubnets[count.index].name
  } 
}
resource "aws_subnet" "private-subs" {
    vpc_id = aws_vpc.main.id
  count = length(var.privatesubnets)
  cidr_block = var.privatesubnets[count.index].cidr
  availability_zone = var.privatesubnets[count.index].az
  map_public_ip_on_launch = var.privatesubnets[count.index].publicip
  tags = {
     Name = var.privatesubnets[count.index].name
  } 
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "devops-igw"
  }
}
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "main route"
  }
}
resource "aws_route_table_association" "publicsubnets" {
    count = length(aws_subnet.public-subs)
  subnet_id      = aws_subnet.public-subs[count.index].id
  route_table_id = aws_route_table.rt.id
}
