module "team_contino_dojo" {
  source              = "./da-teams"
  group_name          = "contino-dojo"
  group_role          = "member"
  members             = [
    "aymscherrer",
    "ian-hancock",
    "kiarashv",
    "mattgillard",
    "ramps41"
  ]
}
