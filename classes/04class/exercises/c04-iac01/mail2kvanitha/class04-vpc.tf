resource "aws_vpc" "class04-vpc" {
  cidr_block = "20.0.0.0/16"
  enable_dns_hostnames = true
}
