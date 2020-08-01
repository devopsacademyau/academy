terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "boomera"

    workspaces {
      name = "dac04-1"
    }
  }
}