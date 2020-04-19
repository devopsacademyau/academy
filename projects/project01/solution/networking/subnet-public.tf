resource "aws_subnet" "public" {
  count  = length(data.aws_availability_zones.available.names)
  vpc_id = aws_vpc.default.id

  cidr_block = cidrsubnet(aws_vpc.default.cidr_block,
    var.newbits,
    count.index + var.netnum-public,
  )

  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.project-name}-public-${data.aws_availability_zones.available.names[count.index]}"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "${var.project-name}-public-rt"
  }
}

resource "aws_route" "public_route_nat" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table_association" "public_rt_association" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id

  lifecycle {
    ignore_changes        = [subnet_id]
    create_before_destroy = true
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "${var.project-name}-igw"
  }
} 

resource "aws_network_acl" "public_nacl" {
  vpc_id     = aws_vpc.default.id
  subnet_ids = aws_subnet.public.*.id

  tags = {
    Name = "${var.project-name}-public-nacl"
  }
}

resource "aws_network_acl_rule" "public_nacl_egress" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = "1"
  egress         = true
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "public_nacl_ingress_all_private" {
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = 100
  egress         = false
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = cidrsubnet(aws_vpc.default.cidr_block,
    1,
    var.netnum-private,
  )
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "public_nacl_custom" {
  count          = length(var.public_nacl_custom)
  network_acl_id = aws_network_acl.public_nacl.id
  rule_number    = count.index + 200
  egress         = var.public_nacl_custom[count.index].type == "egress" ? true : false
  protocol       = var.public_nacl_custom[count.index].protocol
  rule_action    = "allow"
  cidr_block     = var.public_nacl_custom[count.index].cidr
  from_port      = var.public_nacl_custom[count.index].from_port
  to_port        = var.public_nacl_custom[count.index].to_port
}
