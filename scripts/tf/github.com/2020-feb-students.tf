module "team-students-2020-feb" {
  source              = "./da-teams"
  github_token        = var.github_token
  github_organization = var.github_organization
  group_name          = "students-2020-feb"
  members             = [
    {
      name: "andreazzabr",
      role: "member"
    },
    {
      name: "carineoliveira",
      role: "member"
    },
    {
      name: "christina-roperto",
      role: "member"
    },
    {
      name: "deniseddi",
      role: "member"
    },
    {
      name: "drii-cavalcanti",
      role: "member"
    },
    {
      name: "faria-marcio",
      role: "member"
    },
    {
      name: "hsy3418",
      role: "member"
    },
    {
      name: "lgothelipe",
      role: "member"
    },
    {
      name: "luizfds",
      role: "member"
    },
    {
      name: "marcioanatrielo",
      role: "member"
    },
    {
      name: "starkmatt",
      role: "member"
    }
  ]
}

module "y2020-feb-project1-group1" {
  source              = "./da-project"
  github_token        = var.github_token
  github_organization = var.github_organization
  group_name          = "2020-feb-project1-group1"
  admins_team_id      = module.team-admins.team_id
  parent_team_id      = module.team-students-2020-feb.team_id
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
  parent_team_id      = module.team-students-2020-feb.team_id
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
  parent_team_id      = module.team-students-2020-feb.team_id
  members             = [
    "andreazzabr",
    "hsy3418",
    "carineoliveira"
  ]
}

