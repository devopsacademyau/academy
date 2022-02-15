
variable "vpc" {
  type = map
}

variable "public_subnet_1" {
  type = map
}

variable "public_subnet_2" {
  type = map
}

variable "private_subnet_1" {
  type = map
}

variable "private_subnet_2" {
  type = map
}


variable "igw" {
  type = string
}

variable "nat_gw" {
  type = string
}

variable "rt_public" {
  type = string
}

variable "rt_private" {
  type = string
}