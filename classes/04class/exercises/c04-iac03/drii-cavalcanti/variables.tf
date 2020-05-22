# global variables file

####### regions #######
variable "aws_region" {
    description = "Region for the VPC"
    default = "ap-southeast-2"
    type = string
}

####### zones #######
data "aws_availability_zones" "available" {
  state = "available"
  all_availability_zones = true
}

####### cidr blocks #######
variable "vpc_cidr" { 
  type = string
}

# public subnets
variable "subnet_cidrs_public" {
  description = "Subnet CIDRs for public subnets"
  default = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
  type = list(string)
}

# private subnets
variable "subnet_cidrs_private" {
  description = "Subnet CIDRs for private subnets"
  default = ["10.0.11.0/24", "10.0.21.0/24", "172.0.31.0/24"]
  type = list(string)
}

