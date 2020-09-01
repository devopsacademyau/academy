variable "region" {
    type    = string
    default = "ap-southeast-2"
}

variable "key_pair_name" {
    type    = string
}

variable "vpc_cidr" {
    type    = string
}

variable "public_subnets" {
    description = "list of public subnets"
    type = map
}

variable "private_subnets" {
    description = "list of private subnets"
    type = map
}
