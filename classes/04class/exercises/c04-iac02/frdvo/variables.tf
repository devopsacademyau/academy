variable "vpc_cidr" {
  type = string
}

variable "subnets" {
  type = map(object({
    name = string
    cidr = string
  }))
  description = "subnet name and cidr"
}