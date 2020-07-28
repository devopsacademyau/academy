variable "aws_region" {
  default     = "ap-southeast-2"
  type        = string
  description = "Region of the VPC"
}

variable "cidr_block_vpc" {
  #default     = "10.0.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}
variable "private_subnet_cidr_blocks" {
  type        = list
  description = "List of private subnet CIDR blocks"
}

variable "private_subnet_names" {
  type        = list(string)
  description = "List of private subnet names"
}
variable "public_subnet_cidr_blocks" {
  type        = list
  description = "List of public subnet CIDR blocks"
}
variable "public_subnet_names" {
  type        = list(string)
  description = "List of public subnet names"
}

variable "availability_zones" {
  type        = list
  description = "Availability zones"
}