# Declare the input variables

variable "vpcCIDRblock" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  type        = list
  description = "List of public subnet CIDR blocks"
}

variable "public_subnet_names" {
  type        = list
  description = "List of public subnets names"
}

variable "private_subnet_cidr_blocks" {
  type        = list
  description = "List of private subnet CIDR blocks"
}

variable "private_subnet_names" {
  type        = list
  description = "List of private subnets names"
}

variable "destinationCIDRblock" {
  type        = string
  description = "Destination CIDR for route table"
}

variable "availability_zones" {
  type        = list
  description = "List of availability zones"
}
