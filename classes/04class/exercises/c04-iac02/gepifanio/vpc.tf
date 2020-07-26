resource "aws_vpc" "vpc_iac" {
    cidr_block       = var.vpc_cidr
    instance_tenancy = "default"

    tags = {
        Name = "devopsacademy-iac"
    }
}

resource "aws_subnet" "subnet_1_private" {
    vpc_id     = aws_vpc.vpc_iac.id
    cidr_block = var.subnet_1_cidr
    availability_zone = var.az_southeast_a

    tags = {
        Name = var.subnet_1_name
    }
}

resource "aws_subnet" "subnet_2_private" {
    vpc_id     = aws_vpc.vpc_iac.id
    cidr_block = var.subnet_2_cidr
    availability_zone = var.az_southeast_b

    tags = {
        Name = var.subnet_2_name
    }
}

resource "aws_subnet" "subnet_3_public" {
    vpc_id     = aws_vpc.vpc_iac.id
    cidr_block = var.subnet_3_cidr
    availability_zone = var.az_southeast_a

    tags = {
        Name = var.subnet_3_name
    }
}

resource "aws_subnet" "subnet_4_public" {
    vpc_id     = aws_vpc.vpc_iac.id
    cidr_block = var.subnet_4_cidr
    availability_zone = var.az_southeast_b

    tags = {
        Name = var.subnet_4_name
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
    subnet_id     = aws_subnet.subnet_1_private.id

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

resource "aws_route_table_association" "private-a" {
    subnet_id      = aws_subnet.subnet_1_private.id
    route_table_id = aws_route_table.route_table_private.id
}

resource "aws_route_table_association" "private-b" {
    subnet_id      = aws_subnet.subnet_2_private.id
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

resource "aws_route_table_association" "public-a" {
    subnet_id      = aws_subnet.subnet_3_public.id
    route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "public-b" {
    subnet_id      = aws_subnet.subnet_4_public.id
    route_table_id = aws_route_table.route_table_public.id
}