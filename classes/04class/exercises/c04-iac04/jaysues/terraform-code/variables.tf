variable "min_size" {
  type = number
  default = 2
}

variable "max_size" {
  type = number
  default = 5
}

variable "add_threshold" {
  type = number
  default = 60
}

variable "remove_threshold" {
  type = number
  default = 40
}
variable "project" {
  default = "c04-iac04"
  type    = string
}

