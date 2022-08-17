########################################################################
# Define variables to be used for VPC
########################################################################
variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

########################################################################
# Define variables to be used for VPC Subnets
########################################################################
variable "subnet_pub_1_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_pub_2_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_prv_1_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_prv_2_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_pub_1_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_pub_1_az" {
  description = "Subnet Availability Zone"
  type        = string
}

variable "subnet_pub_2_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_pub_2_az" {
  description = "Subnet Availability Zone"
  type        = string
}

variable "subnet_prv_1_az" {
  description = "Subnet Availability Zone"
  type        = string
}

variable "subnet_prv_1_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_prv_2_az" {
  description = "Subnet Availability Zone"
  type        = string
}

variable "subnet_prv_2_cidr" {
  description = "Subnet CIDR"
  type        = string
}

########################################################################
# Define variables to be used for VPC Internet Gateway
########################################################################
variable "internet_gateway_name" {
  description = "Internet Gateway Name"
  type        = string
}

########################################################################
# Define variables to be used for NAT Gateway
########################################################################
variable "nat_gw_name_001" {
  description = "NAT Gateway Name"
  type        = string
}

variable "vpc_enabled" {
  description = "EIP VPC enabled"
  type        = bool
}

########################################################################
# Define variables to be used for VPC Route Tables
########################################################################
variable "internet_cidr" {
  description = "Internet CIDR"
  type        = string
}