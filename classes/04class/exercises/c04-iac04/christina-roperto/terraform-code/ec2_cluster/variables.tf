variable "image_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "exercise_name" {
  type = string
}

variable "subnet_public_ids" {
  type = list
}

variable "scale_up" {
  type = number
}

variable "scale_down" {
  type = number
}
