##
# VPC CIDR
#
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

##
# VPC name
#
variable "vpc_name" {
  default = "devopsacademy-iac"
}

variable "subnets_cidrs_public" {
  description = "CIDRs for public subnet"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "subnets_names_public" {
  description = "Names for public subnets"
  default     = ["Public Subnet 3", "Public Subnet 4"]
}

variable "subnets_cidrs_private" {
  description = "CIDRs for private subnet"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "subnets_names_private" {
  description = "Names for private subnets"
  default     = ["Private Subnet 1", "Private Subnet 2"]
}

variable "azs" {
  description = "Avaialbilities zones"
  default     = ["ap-southeast-2a", "ap-southeast-2b"]
}
variable "availability_zone_a" {
  default = "ap-southeast-2a"
}

variable "region" {
  default = "ap-southeast-2"
}

variable "igw-name" {
  default = "c04-iac-igw"
}

variable "nat-name" {
  default = "c04-gw-NAT"
}

variable "rt-iac" {
  default = "DevOpsAcademy IAC Route Table"
}

variable "rt-iac-private" {
  default = "DevOpsAcademy IAC Private Route Table"
}
