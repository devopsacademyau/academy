# Define input variables
variable "set_vpc_cidr_range" {
  description = "CIDR range of the VPC."
  type        = string
}

variable "subnets" {
  description = "Map object to dynamically create subnets."
  type        = map(any)
}
