variable "cidr_vpc" {
  description = "CIDR block for the VPC. Eg. 10.0.0.0/24  "
  type = string
  # default     = "10.0.0.0/24"
}

variable "exercise_name" {
  type= string
  default = "c04_iac04"
}

variable "scale_up" {
  type = number
  description = "Auto Scaling Group policy - scaling up. Eg 1"
}

variable "scale_down" {
  type = number
  description = "Auto Scaling Group policy - scaling down. Eg 1 or -1"
}
