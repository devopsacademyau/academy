module "team-students-2020-jun" {
  source              = "./da-teams"
  github_token        = var.github_token
  github_organization = var.github_organization
  group_name          = "students-2020-jun"
  members             = [
    {
      name: "alanlima",
      role: "member"
    },
    {
      name: "danielvca",
      role: "member"
    },
    {
      name: "fabioacp",
      role: "member"
    },
    {
      name: "feernandobraga",
      role: "member"
    },
    {
      name: "frdvo",
      role: "member"
    },
    {
      name: "gepifanio",
      role: "member"
    },
    {
      name: "gpavelar",
      role: "member"
    },
    {
      name: "igorjosesantos",
      role: "member"
    },
    {
      name: "jayanath",
      role: "member"
    },
    {
      name: "mail2kvanitha",
      role: "member"
    },
    {
      name: "mfreitassm",
      role: "member"
    },
    {
      name: "mrcsmonteiro",
      role: "member"
    },
    {
      name: "nimmi89",
      role: "member"
    },
    {
      name: "obrientimothya",
      role: "member"
    },
    {
      name: "shahriar048",
      role: "member"
    },
    {
      name: "zarajoy",
      role: "member"
    }
  ]
}