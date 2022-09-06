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

variable "subnet_pub_1_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_pub_2_cidr" {
  description = "Subnet CIDR"
  type        = string
}

variable "subnet_public1_az" {
  description = "Availability Zone"
  type        = string
}

variable "subnet_public2_az" {
  description = "Availability Zone"
  type        = string
}

########################################################################
# Define variables to be used for VPC Internet Gateway
########################################################################
variable "internet_gateway_name" {
  description = "Internet Gateway Name"
  type        = string
}

variable "ec2_key_name" {
  description = "EC2 Key Pair Name"
  type        = string
}

# Define high and low CPU watermarks for auto scaling policy
variable "high_cpu_threshold" {
  description = "Auto scaling high CPU threshold"
  type        = string
}
variable "low_cpu_threshold" {
  description = "Auto scaling low CPU threshold"
  type        = string
}