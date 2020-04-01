module "y2020-feb-project1-group1" {
  source       = "./da-project"
  github_token = var.github_token
  group_name   = "y2020-feb-project1-group1"
  members      = [
    "lgothelipe",
    "luizfds",
    "christina-roperto",
    "marcioanatrielo"
  ]
}

module "y2020-feb-project1-group2" {
  source       = "./da-project"
  github_token = var.github_token
  group_name   = "y2020-feb-project-group2"
  members      = [
    "faria-marcio",
    "starkmatt",
    "deniseddi",
    "drii-cavalcanti"
  ]
}

module "y2020-feb-project1-group3" {
  source       = "./da-project"
  github_token = var.github_token
  group_name   = "y2020-feb-project1-group3"
  members      = [
    "andreazzabr",
    "henriqueediniz",
    "hsy3418",
    "carineoliveira"
  ]
}
