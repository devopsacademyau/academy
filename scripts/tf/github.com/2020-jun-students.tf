module "team-students-2020-jun" {
  source              = "./da-teams"
  group_name          = "students-2020-jun"
  group_role          = "member"
  members             = [
    "alanlima",
    "danielvca",
    "fabioacp",
    "feernandobraga",
    "frdvo",
    "gepifanio",
    "gpavelar",
    "igorjosesantos",
    "jayanath",
    "mail2kvanitha",
    "mfreitassm",
    "mrcsmonteiro",
    "nimmi89",
    "obrientimothya",
    "shahriar048",
    "zarajoy"
  ]
}


module "y2020-jun-project1-group1" {
  source              = "./da-project"
  group_name          = "2020-jun-project1-group1"
  admins_team_id      = module.team-admins.id
  parent_team_id      = module.team-students-2020-jun.id
  members             = [
    "alanlima",
    "zarajoy",
    "fabioacp",
    "feernandobraga",
    "mfreitassm",
    "igorjosesantos"
  ]
}

module "y2020-jun-project1-group2" {
  source              = "./da-project"
  group_name          = "2020-jun-project1-group2"
  admins_team_id      = module.team-admins.id
  parent_team_id      = module.team-students-2020-jun.id
  members             = [
    "mrcsmonteiro",
    "nimmi89",
    "gepifanio",
    "gpavelar",
    "obrientimothya"
  ]
}

module "y2020-jun-project1-group3" {
  source              = "./da-project"
  group_name          = "2020-jun-project1-group3"
  admins_team_id      = module.team-admins.id
  parent_team_id      = module.team-students-2020-jun.id
  members             = [
    "danielvca",
    "frdvo",
    "jayanath",
    "shahriar048",
    "mail2kvanitha"
  ]
}

