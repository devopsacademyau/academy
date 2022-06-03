vpc_cidr = "10.0.0.0/16"

private_subnets = {
  "priv_subnet_1" = {
    cidr = "10.0.1.0/24"
    name = "bcurrey_private_subnet_1"
  }

  "priv_subnet_2" = {
    cidr = "10.0.2.0/24"
    name = "bcurrey_private_subnet_2"
  }

}

public_subnets = {
  "pub_subnet_1" = {
    cidr = "10.0.10.0/24"
    name = "bcurrey_public_subnet_1"
  },

  "pub_subnet_2" = {
    cidr = "10.0.20.0/24"
    name = "bcurrey_public_subnet_2"
  }
}
