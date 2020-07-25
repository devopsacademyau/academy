vpc_cidr = "10.0.0.0/16"
subnets = {
  "private_subnet_a" : {
    name = "doa-iac-private-a",
    cidr = "10.0.0.0/24",
    az   = "ap-southeast-2a"
  },
  "private_subnet_b" : {
    name = "doa-iac-private-b",
    cidr = "10.0.1.0/24",
    az   = "ap-southeast-2b"
  },
  "public_subnet_a" : {
    name = "doa-iac-public-a",
    cidr = "10.0.2.0/24",
    az   = "ap-southeast-2a"
  },

  "public_subnet_b" : {
    name = "doa-iac-public-b",
    cidr = "10.0.3.0/24",
    az   = "ap-southeast-2b"
  }

}
