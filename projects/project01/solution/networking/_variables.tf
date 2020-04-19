variable "project_name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}

variable "newbits" {
  type = number
  default = 8
}

variable "netnum_private" {
  type = number
  default = 0
}

variable "netnum_public" {
  type = number
  default = 128
}

variable "private_nacl_custom" {
  type = list(map(string))
  default = []
}

variable "public_nacl_custom" {
  type = list(map(string))
  default = []
}
