variable "region" {
  type        = string
}

variable "image_id" {
  type        = string
}

variable "min_size" {
  type        = number
}

variable "max_size" {
  type        = number
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
