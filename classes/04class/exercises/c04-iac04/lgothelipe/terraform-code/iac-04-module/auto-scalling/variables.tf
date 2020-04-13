variable "scaling_up" {
  type        = number
  description = "Auto Scaling Group - Policies Increase"
}

variable "scaling_down" {
  type        = number
  description = "Auto Scaling Group - Policies Decrease"
}

variable "launch_temp_id" {
  type        = string
  description = "Launch template ID"
}

variable "default_vpc_id" {
  type        = string
  description = "Default VPC ID"
}

variable "image_id" {
  type        = string
  description = "AMI Id"
}