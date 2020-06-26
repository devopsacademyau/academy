module "team-instructors" {
  source              = "./da-teams"
  group_name          = "instructors"
  group_role          = "maintainer"
  members             = [
    "caiocezart",
    "denstorti",
    "kikobr82",
    "omarst9"
  ]
}
