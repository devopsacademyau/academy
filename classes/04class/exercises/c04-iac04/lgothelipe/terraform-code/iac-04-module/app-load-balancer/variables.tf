variable "security_groups" {
    type    = list
}

variable "subnets_id" {
  type        = list
  description = "Subnets Id"
}

variable "target_group_arn" {
  type        = string
  description = "target group arn"
}