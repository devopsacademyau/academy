availability_zones = ["ap-southeast-2a", "ap-southeast-2c"]

vpc = {
  "cidr" = "10.0.0.0/16"
  "name" = "devopsacademy-iac-vpc"
}

public_subnet_a = {
  "cidr" = "10.0.101.0/24"
  "name" = "devopsacademy-iac-public-subnet-a"
}


public_subnet_b = {
  "cidr" = "10.0.201.0/24"
  "name" = "devopsacademy-iac-public-subnet-b"
}


private_subnet_a = {
  "cidr" = "10.0.1.0/24"
  "name" = "devopsacademy-iac-private-subnet-a"
}


private_subnet_b = {
  "cidr" = "10.0.2.0/24"
  "name" = "devopsacademy-iac-private-subnet-b"
}

igw        = "devopsacademy-iac-igw"
nat_gw     = "devopsacademy-iac-nat"
rt_public  = "devopsacademy-iac-rt-public"
rt_private = "devopsacademy-iac-rt-private"