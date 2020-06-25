module "team-external-students" {
  source              = "./da-teams"
  github_token        = var.github_token
  github_organization = var.github_organization
  group_name          = "external-students"
  members             = [
    {
      name: "afaryy",
      role: "member"
    },
    {
      name: "albertoeks",
      role: "member"
    },
    {
      name: "carloshz4",
      role: "member"
    },
    {
      name: "ebeserra"
      role: "member"
    },
    {
      name: "maladham1980",
      role: "member"
    },
    {
      name: "raghunadhpokkalath",
      role: "member"
    },
    {
      name: "rodrigovcesar",
      role: "member"
    },
    {
      name: "roperto",
      role: "member"
    },
    {
      name: "ramiray",
      role: "member"
    }
  ]
}

