output "aws_vpc_id" {
    value = aws_vpc.main.id
}
output "aws_route_table_rtprivate_id" {
    value = aws_route_table.rtprivate.id
}
output "aws_route_table_rtpublic_id" {
    value = aws_route_table.rtpublic.id
}
output "aws_subnet_private-subs_id" {
    value = aws_subnet.private-subs[*].id
}
output "aws_route_table_association_rtprivatesubnets_id" {
    value = aws_route_table_association.rtprivatesubnets[*].id
}
output "aws_subnet_public-subs_id" {
    value = aws_subnet.public-subs[*].id
}
output "aws_internet_gateway_id" {
    value = aws_internet_gateway.igw.id
}
output "aws_route_table_association_rtpublicsubnets_id" {
    value = aws_route_table_association.rtpublicsubnets[*].id
}
output "aws_network_acl_private_id" {
    value = aws_network_acl.private.id
}
output "aws_network_acl_public_id" {
    value = aws_network_acl.public.id
}

output "private_subnet_id1" {
    value = aws_subnet.private-subs[0].id
}

output "private_subnet_id2" {
    value = aws_subnet.private-subs[1].id
}

output "pub_sub1" {
    value = aws_subnet.public-subs[0].id
}

output "pub_sub2" {
    value = aws_subnet.public-subs[1].id
}
