variable "vpc_id" {
    type    = string
}

variable "public_subnets" {
    description = "list of public subnets"
    type = any
}