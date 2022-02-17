
vpc = {
  "cidr" = "10.0.0.0/16"
  "name" = "devopsacademy-iac-vpc"
}

public_subnet_1 = {
  "cidr" = "10.0.1.0/24"
  "name" = "public_subnet_1"
}


public_subnet_2 = {
  "cidr" = "10.0.2.0/24"
  "name" = "public_subnet_2"
}


private_subnet_1 = {
  "cidr" = "10.0.3.0/24"
  "name" = "private_subnet_1"
}


private_subnet_2 = {
  "cidr" = "10.0.4.0/24"
  "name" = "private_subnet_2"
}

igw        = "igw"
nat_gw     = "nat"
rt_public  = "rt-public"
rt_private = "rt-private"