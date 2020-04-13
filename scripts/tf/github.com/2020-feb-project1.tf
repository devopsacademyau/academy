module "y2020-feb-project1-group1" {
  source              = "./da-project"
  github_token        = var.github_token
  github_organization = var.github_organization
  group_name          = "2020-feb-project1-group1"
  admins_team_id      = module.team-admins.team_id
  members             = [
    "lgothelipe",
    "luizfds",
    "christina-roperto",
    "marcioanatrielo"
  ]
}

module "y2020-feb-project1-group2" {
  source              = "./da-project"
  github_token        = var.github_token
  github_organization = var.github_organization
  group_name          = "2020-feb-project1-group2"
  admins_team_id      = module.team-admins.team_id
  members             = [
    "faria-marcio",
    "starkmatt",
    "deniseddi",
    "drii-cavalcanti"
  ]
}

module "y2020-feb-project1-group3" {
  source              = "./da-project"
  github_token        = var.github_token
  github_organization = var.github_organization
  group_name          = "2020-feb-project1-group3"
  admins_team_id      = module.team-admins.team_id
  members             = [
    "andreazzabr",
    "hsy3418",
    "carineoliveira"
  ]
}
