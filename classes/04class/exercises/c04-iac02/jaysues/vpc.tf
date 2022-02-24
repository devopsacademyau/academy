
resource "aws_vpc" "devopsacademy_iac" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name : "${var.env_prefix}-vpc"
  }
}
resource "aws_subnet" "pub_a" {
  vpc_id            = aws_vpc.devopsacademy_iac.id
  cidr_block        = var.pub_subnet_a["cidr"]
  availability_zone = var.availability_zones[0]

  tags = {
    Name = var.pub_subnet_a["name"]
  }
}


resource "aws_subnet" "pub_b" {
  vpc_id            = aws_vpc.devopsacademy_iac.id
  cidr_block        = var.pub_subnet_b["cidr"]
  availability_zone = var.availability_zones[1]

  tags = {
    Name = var.pub_subnet_b["name"]
  }
}

resource "aws_subnet" "priv_a" {
  vpc_id            = aws_vpc.devopsacademy_iac.id
  cidr_block        = var.priv_subnet_a["cidr"]
  availability_zone = var.availability_zones[0]

  tags = {
    Name = var.priv_subnet_a["name"]
  }
}


resource "aws_subnet" "priv_b" {
  vpc_id            = aws_vpc.devopsacademy_iac.id
  cidr_block        = var.priv_subnet_b["cidr"]
  availability_zone = var.availability_zones[1]

  tags = {
    Name = var.priv_subnet_b["name"]
  }
}



resource "aws_internet_gateway" "devopsacademy_igw" {
  vpc_id = aws_vpc.devopsacademy_iac.id
  tags = {
    Name : "${var.env_prefix}-igw"
  }
}

resource "aws_route_table" "devopsacademy_route_table" {
  vpc_id = aws_vpc.devopsacademy_iac.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devopsacademy_igw.id
    # nat_gateway_id = aws_internet_gateway.devopsacademy_igw.id
  }
  tags = {
    Name : "${var.env_prefix}-rtb"
  }
}
resource "aws_route_table_association" "pub_a" {
    subnet_id      = aws_subnet.pub_a.id
    route_table_id = aws_route_table.devopsacademy_route_table.id
  }

resource "aws_route_table_association" "pub_b" {
    subnet_id      = aws_subnet.pub_b.id
    route_table_id = aws_route_table.devopsacademy_route_table.id
  }


resource "aws_route_table_association" "priv_a" {
    subnet_id      = aws_subnet.priv_a.id
    route_table_id = aws_route_table.devopsacademy_route_table.id
  }


resource "aws_route_table_association" "priv_b" {
    subnet_id      = aws_subnet.priv_b.id
    route_table_id = aws_route_table.devopsacademy_route_table.id
  }

resource "aws_eip" "devopsacademy_nat_gateway" {
  vpc = true
}

resource "aws_nat_gateway" "devopsacademy_nat_gateway" {
    allocation_id = aws_eip.devopsacademy_nat_gateway.id
    subnet_id     = aws_subnet.pub_a.id
    depends_on = [aws_internet_gateway.devopsacademy_igw]
    tags = {
      Name = "${var.env_prefix}-natgw"
    }
    
  }
