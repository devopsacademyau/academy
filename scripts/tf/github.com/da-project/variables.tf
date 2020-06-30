variable "group_name" {
  type = string
}

variable "members" {
  type = list
}

variable "admins_team_id" {
  type = string
}

variable "parent_team_id" {
  type = string
  default = ""
}