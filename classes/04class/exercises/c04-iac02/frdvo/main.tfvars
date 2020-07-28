vpc_cidr = "10.0.0.0/16"
subnets = {
  "public_subnet_1" : {
    name = "public_subnet_1",
    cidr = "10.0.101.0/24"
  },

  "public_subnet_2" : {
    name = "public_subnet_2",
    cidr = "10.0.102.0/24"
  }

  "private_subnet_1" : {
    name = "private_subnet_1",
    cidr = "10.0.201.0/24"
  },
  "private_subnet_2" : {
    name = "private_subnet_2",
    cidr = "10.0.202.0/24"
  }
}