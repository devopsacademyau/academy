module "team-admins" {
  source              = "./da-teams"
  group_name          = "admin"
  group_role          = "maintainer"
  members             = [
    "caiocezart",
    "denstorti",
    "kikobr82"
  ]
}