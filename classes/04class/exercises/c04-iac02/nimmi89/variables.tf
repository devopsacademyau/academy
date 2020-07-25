#Declare the input variables

variable "vpcCIDRblock" {
  default     = "10.0.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr_blocks" {
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
  type        = list
  description = "List of public subnet CIDR blocks"
}

variable "public_subnet_names" {
  default     = ["public-a", "public-b"]
  type        = list
  description = "List of public subnets names"
}

variable "private_subnet_cidr_blocks" {
  default     = ["10.0.30.0/24", "10.0.31.0/24"]
  type        = list
  description = "List of private subnet CIDR blocks"
}

variable "private_subnet_names" {
  default     = ["private-a", "private-b"]
  type        = list
  description = "List of private subnets names"
}

variable "destinationCIDRblock" {
    default = "0.0.0.0/0"
}

variable "availability_zones" {
  default     = ["ap-southeast-2a", "ap-southeast-2b"]
  type        = list
  description = "List of availability zones"
}
 
