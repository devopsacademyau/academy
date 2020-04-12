

variable "public_subnets" { type = list(map(any))}
variable "private_subnets" { type = list(map(any))}

variable "vpc_cidr" { type = "string" }

variable "region" {
    default = "ap-southeast-2"
}





