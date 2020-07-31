variable "name" {
  type        = string
  description = "Name of the VPC"
}

variable "region" {
   type        = string
  description = "Region of the VPC"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  type        = list
  description = "List of public subnet CIDR blocks"
}

variable "private_subnet_cidr_blocks" {
  type        = list
  description = "List of private subnet CIDR blocks"
}

variable "availability_zones" {
  type        = list
  description = "List of availability zones"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Extra tags to attach to the VPC resources"
 
}

variable "destination_cidr_block" {
  type        = string
  description = "destination cidr block"
}