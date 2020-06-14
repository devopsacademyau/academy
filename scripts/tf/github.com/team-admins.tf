module "team-admins" {
  source              = "./da-teams"
  github_token        = var.github_token
  github_organization = var.github_organization
  group_name          = "admin"
  members             = [
    {
      name: "caiocezart",
      role: "maintainer"
    },
    {
      name: "denstorti",
      role: "maintainer"
    },
    {
      name: "kikobr82",
      role: "maintainer"
    }
  ]
}