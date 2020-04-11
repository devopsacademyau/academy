aws_region = "ap-southeast-2"

devopsacademy_vpc = {
  name                 = "devopsacademy-iac"
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  instance_tenancy     = "default"
}

public_subnets = [{
  name       = "public-a"
  cidr_block = "10.0.1.0/24"
  }, {
  name       = "public-b"
  cidr_block = "10.0.11.0/24"
  }
]

private_subnets = [{
  name       = "private-a"
  cidr_block = "10.0.0.0/24"
  }, {
  name       = "private-b"
  cidr_block = "10.0.10.0/24"
  }
]
