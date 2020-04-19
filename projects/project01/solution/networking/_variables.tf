variable "project-name" {
  type = string
}
variable "vpc-cidr" {
  type = string
}

variable "newbits" {
  type = number
  default = 8
}

variable "netnum-private" {
  type = number
  default = 0
}

variable "netnum-public" {
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
