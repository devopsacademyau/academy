module "team-external-students" {
  source              = "./da-teams"
  group_name          = "external-students"
  group_role          = "member"
  members             = [
    "afaryy",
    "albertoeks",
    "carloshz4",
    "ebeserra",
    "maladham1980",
    "raghunadhpokkalath",
    "rodrigovcesar",
    "roperto",
    "ramiray"
  ]
}

