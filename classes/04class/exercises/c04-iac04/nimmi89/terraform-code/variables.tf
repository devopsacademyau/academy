variable "subnets" {
  type        = list
  description = "The subnets to be used."
}

variable "vpc_id" {
  type        = string
  description = "VPC id to be used."
}


variable "cpu-upper-limit" {
  type        = string
  description = "Value for the cpu at which to scale out"
}

variable "cpu-lower-limit" {
  type        = string
  description = "Values for the lower limit at which to scale in"
}
