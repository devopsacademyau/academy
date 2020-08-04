variable "vpc_cidr" {
  description = "VPC CIDR"
}

variable "vpc_name" {
  description = "VPC name"
}

variable "subnets_cidrs_public" {
  description = "CIDRs for public subnet"
  # default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "subnets_names_public" {
  description = "Names for public subnets"
  # default     = ["Public Subnet 3", "Public Subnet 4"]
}

variable "subnets_cidrs_private" {
  description = "CIDRs for private subnet"
  # default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "subnets_names_private" {
  description = "Names for private subnets"
  # default     = ["Private Subnet 1", "Private Subnet 2"]
}

variable "azs" {
  description = "Avaialbilities zones"
  # default     = ["ap-southeast-2a", "ap-southeast-2b"]
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
