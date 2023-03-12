variable "scaling_up" {
  type        = number
  description = "Auto Scaling Group - scale up"
}

variable "scaling_down" {
  type        = number
  description = "Auto Scaling Group - scale down"
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