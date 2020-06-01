module "team-admins" {
  source              = "./da-teams"
  github_token        = var.github_token
  github_organization = var.github_organization
  group_name          = "admin"
  members             = [
    {
      name: "caiocezart",
      role: "maintainer"
    },
    {
      name: "denstorti",
      role: "maintainer"
    },
    {
      name: "kikobr82",
      role: "maintainer"
    }
  ]
}

module "team-instructors" {
  source              = "./da-teams"
  github_token        = var.github_token
  github_organization = var.github_organization
  group_name          = "instructors"
  members             = [
    {
      name: "caiocezart",
      role: "maintainer"
    },
    {
      name: "denstorti",
      role: "maintainer"
    },
    {
      name: "kikobr82",
      role: "maintainer"
    }
  ]
}

module "team-students" {
  source              = "./da-teams"
  github_token        = var.github_token
  github_organization = var.github_organization
  group_name          = "students"
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
      name: "netizen89",
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








