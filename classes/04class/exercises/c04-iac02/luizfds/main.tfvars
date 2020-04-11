aws_region = "ap-southeast-2"

devopsacademy_vpc = {
  name                 = "devopsacademy-iac"
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  instance_tenancy     = "default"
}
