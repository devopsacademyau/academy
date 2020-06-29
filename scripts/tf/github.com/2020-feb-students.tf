module "team-students-2020-feb" {
  source              = "./da-teams"
  group_name          = "students-2020-feb"
  group_role          = "member"
  members             = [
    "andreazzabr",
    "carineoliveira",
    "christina-roperto",
    "deniseddi",
    "drii-cavalcanti",
    "faria-marcio",
    "hsy3418",
    "lgothelipe",
    "luizfds",
    "marcioanatrielo",
    "starkmatt"
  ]
}

module "y2020-feb-project1-group1" {
  source              = "./da-project"
  group_name          = "2020-feb-project1-group1"
  admins_team_id      = module.team-admins.id
  parent_team_id      = module.team-students-2020-feb.id
  members             = [
    "lgothelipe",
    "luizfds",
    "christina-roperto",
    "marcioanatrielo"
  ]
}

module "y2020-feb-project1-group2" {
  source              = "./da-project"
  group_name          = "2020-feb-project1-group2"
  admins_team_id      = module.team-admins.id
  parent_team_id      = module.team-students-2020-feb.id
  members             = [
    "faria-marcio",
    "starkmatt",
    "deniseddi",
    "drii-cavalcanti"
  ]
}

module "y2020-feb-project1-group3" {
  source              = "./da-project"
  group_name          = "2020-feb-project1-group3"
  admins_team_id      = module.team-admins.id
  parent_team_id      = module.team-students-2020-feb.id
  members             = [
    "andreazzabr",
    "hsy3418",
    "carineoliveira"
  ]
}

