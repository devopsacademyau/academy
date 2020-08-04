variable "vpc_cidr" {
  description = "VPC CIDR"
}

variable "vpc_name" {
  description = "VPC name"
}

variable "subnets_cidrs_public" {
  description = "CIDRs for public subnet"
}

variable "subnets_names_public" {
  description = "Names for public subnets"
}

variable "subnets_cidrs_private" {
  description = "CIDRs for private subnet"
}

variable "subnets_names_private" {
  description = "Names for private subnets"
}

variable "azs" {
  description = "Avaialbilities zones"
}

variable "region" {
  description = "App region"
}

variable "igw_name" {
  description = "Internet Gateway Name"
}

variable "nat_name" {
  description = "NAT Name"
}

variable "rt_iac" {
  description = "DevOps Academy IAC RT"
}
