variable "image_id" {
  type        = string
  description = "AMI Id used for ASG lanch template"
}

variable "subnets_id" {
  type        = list
  description = "Subnets Id"
}

variable "scaling_up" {
  type        = number
  description = "Auto Scaling Group - Scale up"
}

variable "scaling_down" {
  type        = number
  description = "Auto Scaling Group - Scale down"
}