data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_vpc" "vpc_iac" {
    cidr_block       = var.vpc_cidr
    instance_tenancy = "default"

    tags = {
        Name = "devopsacademy-iac"
    }
}

resource "aws_subnet" "public" {
    for_each                = var.public_subnets
    vpc_id                  = aws_vpc.vpc_iac.id
    cidr_block              = each.value.cidr_block
    availability_zone       = each.value.zone
    tags = {
        Name = each.key
    }
}

resource "aws_subnet" "private" {
    for_each                = var.private_subnets
    vpc_id                  = aws_vpc.vpc_iac.id
    cidr_block              = each.value.cidr_block
    availability_zone       = each.value.zone
    tags = {
        Name = each.key
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc_iac.id

    tags = {
        Name = "igw-iac"
    }
}

resource "aws_eip" "lb" {
    vpc      = true
}

resource "aws_nat_gateway" "ngw" {
    allocation_id = aws_eip.lb.id
    subnet_id     = values(aws_subnet.private)[0].id

    tags = {
        Name = "ngw-iac"
    }
}

resource "aws_route_table" "route_table_private" {
    vpc_id = aws_vpc.vpc_iac.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.ngw.id
    }

    tags = {
        Name = "rt_iac_private"
    }
}

resource "aws_route_table_association" "private" {
    for_each       = aws_subnet.private
    subnet_id      = each.value.id
    route_table_id = aws_route_table.route_table_private.id
}

resource "aws_route_table" "route_table_public" {
    vpc_id = aws_vpc.vpc_iac.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "rt_iac_public"
    }
}

resource "aws_route_table_association" "public" {
    for_each       = aws_subnet.public
    subnet_id      = each.value.id
    route_table_id = aws_route_table.route_table_public.id
}