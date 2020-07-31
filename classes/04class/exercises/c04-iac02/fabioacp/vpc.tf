locals {
  nat_gateway_count = var.single_nat_gateway ? 1 : var.one_nat_gateway_per_az ? length(var.azs) : length(var.private_subnets)
  nat_gateway_ips = split(",", join(",", aws_eip.nat.*.id))
}

################
# VPC
################
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.dns_support
  enable_dns_hostnames = var.dns_host_names

  tags = merge(
    var.tags,
    {
      "Name" = "${var.name}-iac"
    },
  )
}

################
# Public subnet
################
resource "aws_subnet" "public" {
  count = length(var.public_subnets) > 0 && length(var.public_subnets) >= length(var.azs) ? length(var.public_subnets) : 0

  vpc_id                  = aws_vpc.this.id
  cidr_block              = element(concat(var.public_subnets, [""]), count.index)
  availability_zone       = length(regexall("^[a-z]{2}-", element(var.azs, count.index))) > 0 ? element(var.azs, count.index) : null
  availability_zone_id    = length(regexall("^[a-z]{2}-", element(var.azs, count.index))) == 0 ? element(var.azs, count.index) : null
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(
    {
      "Name" = format("%s-%s", element(var.public_subnet_names, count.index), element(var.azs, count.index))
    },
    var.tags,
    var.public_subnet_tags,
  )
}

#################
# Private subnet
#################
resource "aws_subnet" "private" {
  count = length(var.private_subnets) > 0 && length(var.private_subnets) >= length(var.azs) ? length(var.private_subnets) : 0

  vpc_id               = aws_vpc.this.id
  cidr_block           = var.private_subnets[count.index]
  availability_zone    = length(regexall("^[a-z]{2}-", element(var.azs, count.index))) > 0 ? element(var.azs, count.index) : null
  availability_zone_id = length(regexall("^[a-z]{2}-", element(var.azs, count.index))) == 0 ? element(var.azs, count.index) : null

  tags = merge(
    {
      "Name" = format("%s-%s", element(var.private_subnet_names, count.index), element(var.azs, count.index))
    },
    var.tags,
    var.private_subnet_tags,
  )
}

###################
# Internet Gateway
###################
resource "aws_internet_gateway" "this" {
  count = var.create_igw ? 1 : 0

  vpc_id = aws_vpc.this.id

  tags = merge(
    {
      "Name" = "${var.name}-ig"
    },
    var.tags,
    var.igw_tags,
  )
}

##############
# NAT Gateway
##############
resource "aws_eip" "nat" {
  count = var.enable_nat_gateway ? local.nat_gateway_count : 0

  vpc = true

  tags = merge(
    {
      "Name" = format(
        "%s-%s",
        var.name,
        element(var.azs, var.single_nat_gateway ? 0 : count.index),
      )
    },
    var.tags,
    var.nat_eip_tags,
  )
}

resource "aws_nat_gateway" "this" {
  count = var.enable_nat_gateway ? local.nat_gateway_count : 0

  allocation_id = element(
    local.nat_gateway_ips,
    var.single_nat_gateway ? 0 : count.index,
  )
  subnet_id = element(
    aws_subnet.public.*.id,
    var.single_nat_gateway ? 0 : count.index,
  )

  tags = merge(
    {
      "Name" = format(
        "%s-%s",
        var.name,
        element(var.azs, var.single_nat_gateway ? 0 : count.index),
      )
    },
    var.tags,
    var.nat_gateway_tags,
  )

  depends_on = [aws_internet_gateway.this]
}

################
# Publiс routes
################
resource "aws_route_table" "public" {
  count = length(var.public_subnets) > 0 ? 1 : 0

  vpc_id = aws_vpc.this.id

  tags = merge(
    {
      "Name" = format("%s-${var.public_subnet_suffix}", var.name)
    },
    var.tags,
    var.public_route_table_tags,
  )
}

#################
# Private routes
#################
resource "aws_route_table" "private" {
  count = length(var.private_subnets) > 0 ? local.nat_gateway_count : 0

  vpc_id = aws_vpc.this.id

  tags = merge(
    {
      "Name" = var.single_nat_gateway ? "${var.name}-${var.private_subnet_suffix}" : format(
        "%s-${var.private_subnet_suffix}-%s",
        var.name,
        element(var.azs, count.index),
      )
    },
    var.tags,
    var.private_route_table_tags,
  )
}

##########################
# Route table association
##########################
resource "aws_route_table_association" "private" {
  count = length(var.private_subnets) > 0 ? length(var.private_subnets) : 0

  subnet_id = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(
    aws_route_table.private.*.id,
    var.single_nat_gateway ? 0 : count.index,
  )
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets) > 0 ? length(var.public_subnets) : 0

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public[0].id
}