variable "group_name" {
  type = string
}
variable "members" {
  type = list
}
variable "group_role" {
  type = string
}
variable "parent_team_id" { 
  type    = string
  default = null
}
variable "privacy" { 
  type    = string
  default = "closed"
}