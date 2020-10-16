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