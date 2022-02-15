# Declare values for the variables in variables.tf
set_vpc_cidr_range = "10.0.0.0/16"

subnets = {
  subnet_01 = {
    name = "public_subnet_01"
    cidr = "10.0.1.0/24"
    az   = "ap-southeast-2a"
  }
  subnet_02 = {
    name = "public_subnet_02"
    cidr = "10.0.2.0/24"
    az   = "ap-southeast-2b"
  }
  subnet_03 = {
    name = "private_subnet_01"
    cidr = "10.0.3.0/24"
    az   = "ap-southeast-2a"
  }
  subnet_04 = {
    name = "private_subnet_02"
    cidr = "10.0.4.0/24"
    az   = "ap-southeast-2b"
  }
}
