variable "vpc_id" {
  type        = string
  description = "VPC ID for deployments"
}

variable "public_subnet_ids" {
  type        = list(string)
}

variable "scale_up_by" {
  type = number
}

variable "scale_down_by" {
  type = number
  description = "This should be a negative value"
}
