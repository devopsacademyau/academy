variable "group_name" {
  type = string
}
variable "members" {
  type = list
}
variable "github_organization" {
}
variable "github_token" {
}
variable "admins_team_id"{}

variable "parent_team_id" {
  type = string
  default = ""
}