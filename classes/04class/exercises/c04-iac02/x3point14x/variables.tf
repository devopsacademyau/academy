variable "vpc_cidr" {
    type = string
}

variable "private_subnets" {
    type = map(object({
        cidr = string
        name = string
    }))
  
}

variable "public_subnets" {
    type = map(object({
            cidr = string
            name = string
    }))
}