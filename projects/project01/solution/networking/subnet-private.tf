resource "aws_subnet" "private" {
  count  = length(data.aws_availability_zones.available.names)
  vpc_id = aws_vpc.default.id

  cidr_block = cidrsubnet(aws_vpc.default.cidr_block,
    var.newbits,
    count.index + var.netnum-private,
  )

  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = {

    Name = "${var.project-name}-private-${data.aws_availability_zones.available.names[count.index]}"
  }

  depends_on = [aws_nat_gateway.nat_gw]
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "${var.project-name}-private-rt"
  }
}

resource "aws_route" "private_route_nat" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_nat_gateway.nat_gw]
}

resource "aws_route_table_association" "private_rt_association" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_rt.id

  lifecycle {
    ignore_changes        = [subnet_id]
    create_before_destroy = true
  }
}

resource "aws_eip" "nat_eip" {
  vpc   = true

  tags = {
    Name = "${var.project-name}-nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.project-name}-natgw"
  }
}

resource "aws_network_acl" "private_nacl" {
  vpc_id     = aws_vpc.default.id
  subnet_ids = aws_subnet.private.*.id

  tags = {
    Name = "${var.project-name}-private-nacl"
  }
}

resource "aws_network_acl_rule" "private_nacl_egress_all" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = "1"
  egress         = true
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "private_nacl_ingress_all_local" {
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = 100
  egress         = false
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = aws_vpc.default.cidr_block
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "private_nacl_custom" {
  count          = length(var.private_nacl_custom)
  network_acl_id = aws_network_acl.private_nacl.id
  rule_number    = count.index + 200
  egress         = var.private_nacl_custom[count.index].type == "egress" ? true : false
  protocol       = var.private_nacl_custom[count.index].protocol
  rule_action    = "allow"
  cidr_block     = var.private_nacl_custom[count.index].cidr
  from_port      = var.private_nacl_custom[count.index].from_port
  to_port        = var.private_nacl_custom[count.index].to_port
}
