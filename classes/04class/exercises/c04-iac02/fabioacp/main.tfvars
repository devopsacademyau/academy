name = "devopsacademy"

tags = {
  Owner       = "FACP"
  Environment = "DEV"
  Project     = "C04-iac02"
  BillingCode = "0800"
}

vpc_cidr = "10.0.0.0/16"

azs                     = ["ap-southeast-2a", "ap-southeast-2b"]
public_subnets          = ["10.0.1.0/24", "10.0.3.0/24"]
public_subnet_names     = ["public-sb1", "public-sb2"]
private_subnets         = ["10.0.3.0/24", "10.0.4.0/24"]
private_subnet_names    = ["private-sb1", "private-sb2"]

enable_nat_gateway     = true
single_nat_gateway     = true



