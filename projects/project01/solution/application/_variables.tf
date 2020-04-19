variable "project_name" {
  type = string
}

variable "app_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnets_ids" {
  type = list(string)
}

variable "db" {
  type = map(string)
}

variable "ecs_nodes" {}
