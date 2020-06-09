variable "image_id" {
  type        = string
  description = "AMI Id"
}

variable "subnets_id" {
  type        = list
  description = "Subnets Id"
}

variable "scaling_up" {
  type        = number
  description = "Auto Scaling Group - Policies Increase"
}

variable "scaling_down" {
  type        = number
  description = "Auto Scaling Group - Policies Decrease"
}