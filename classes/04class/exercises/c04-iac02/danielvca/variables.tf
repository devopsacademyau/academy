variable "vpc_cidr" {
  type = string
}

variable "subnets" {
  type = map(object({
    name = string
    cidr = string
    az   = string
  }))
  description = "subnets"
}
 