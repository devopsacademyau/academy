output "ec2_instance" {
  description = "ec2 instance details"
  value = {
    id        = aws_instance.ec2_default.id
    public_id = aws_instance.ec2_default.public_ip
  }
}

output "s3_bucket" {
  description = "s3 bucket"
  value = {
    bucket      = aws_s3_bucket.default.bucket
    id          = aws_s3_bucket.default.id
    domain_name = aws_s3_bucket.default.bucket_domain_name
  }
}

output "network_resources_ids" {
  description = "list the network resources ids created"
  value = {
    vpc_id            = aws_vpc.vpc_devops.id
    subnet_id         = aws_subnet.subnet_devops.id
    route_table_id    = aws_route_table.rt_devops.id
    igw_id            = aws_internet_gateway.igw_default.id
    security_group_id = aws_security_group.sg_allow_ssh.id
  }
}