variable "vpc" {
  type = map
}

variable "public_subnet_ids" {
  type = list
}

variable "ami_id" {
  type = string
}

variable tags {
  type = map
}

variable scales {
  type = map
}


