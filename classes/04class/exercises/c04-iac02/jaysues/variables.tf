variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
  type    = string
}

variable "env_prefix" {
  default = "devopsacademy"
  type    = string
}

variable "availability_zones" {
  default = ["ap-southeast-2a", "ap-southeast-2c"]
  type    = list(string)
}

variable "pub_subnet_a" {
  type = map(any)
}

variable "pub_subnet_b" {
  type = map(any)
}

variable "priv_subnet_a" {
  type = map(any)
}

variable "priv_subnet_b" {
  type = map(any)
}
