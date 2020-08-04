variable "region" {
  type        = string
}

variable "amis" {
  type        = string
}

variable "min_size" {
  type        = number
}

variable "max_size" {
  type        = number
}


variable "image_id" {
    type = string
    default     = "ami-0b781a9543e01e880"
}


variable "project" {
  description = "the name of the project"
  type        = string
}

variable "add_threshold" {
  type        = number
}

variable "remove_threshold" {
  type        = number
}
