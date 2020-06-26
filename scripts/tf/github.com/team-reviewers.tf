module "team-reviewers" {
  source              = "./da-teams"
  github_token        = var.github_token
  github_organization = var.github_organization
  group_name          = "reviewers"
  members             = [
    {
      name: "deniseddi",
      role: "member"
    },
    {
      name: "starkmatt",
      role: "member"
    },
  ]
}
