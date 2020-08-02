variable "availability_zones" {
  type = list
}

variable "vpc" {
  type = map
}

variable "public_subnet_a" {
  type = map
}

variable "public_subnet_b" {
  type = map
}

variable "private_subnet_a" {
  type = map
}

variable "private_subnet_b" {
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