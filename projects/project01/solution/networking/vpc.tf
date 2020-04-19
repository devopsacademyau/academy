resource "aws_vpc" "default" {
  cidr_block           = var.vpc-cidr
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project-name}-vpc"
  }
}
