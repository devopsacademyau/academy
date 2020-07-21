terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "alima-devopsacademy"

    workspaces {
      name = "c04-iac02"
    }
  }
}