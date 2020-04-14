resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "devopsacademy-iac"
  }
}

resource "aws_subnet" "my_subnets" {
    count = length(var.subnets)
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.subnets[count.index].cidr
    map_public_ip_on_launch = var.subnets[count.index].public 
    availability_zone = var.subnets[count.index].zone
    tags = {
        Name = "c04-iac02"
    }
}

resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "c04-iac02"
  }
}

resource "aws_route_table" "my_igw_route_table" {
    vpc_id = aws_vpc.my_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_internet_gateway.id
    }
    tags = {
        Name = "c04-iac02"
    }
}

resource "aws_route_table_association" "my_route_table_association_public_1" {
    subnet_id = aws_subnet.my_subnets[0].id
    route_table_id = aws_route_table.my_igw_route_table.id
}

resource "aws_route_table_association" "my_route_table_association_public_2" {
    subnet_id = aws_subnet.my_subnets[1].id
    route_table_id = aws_route_table.my_igw_route_table.id
}


resource "aws_eip" "my_elastic_IP" {
    vpc = true
}


resource "aws_nat_gateway" "my_nat_gateway" {
    allocation_id = aws_eip.my_elastic_IP.id
    subnet_id = aws_subnet.my_subnets[2].id
  tags = {
    Name = "c04-iac02"
  }
}

resource "aws_route_table" "my_nat_route_table" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.my_nat_gateway.id
    }
    tags = {
        Name = "c04-iac02"
    }
}

resource "aws_route_table_association" "my_route_table_association_private_1" {
    subnet_id = aws_subnet.my_subnets[2].id
    route_table_id = aws_route_table.my_nat_route_table.id
}

resource "aws_route_table_association" "my_route_table_association_private_2" {
    subnet_id = aws_subnet.my_subnets[3].id
    route_table_id = aws_route_table.my_nat_route_table.id
}

