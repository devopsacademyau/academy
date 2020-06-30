module "team" {
  source              = "../da-teams"
  group_name          = var.group_name
  group_role          = "maintainer"
  parent_team_id      = var.parent_team_id
  members             = var.members
}

resource "github_team_repository" "team_repo" {
  team_id    = module.team.id
  repository = github_repository.repo.name
  permission = "maintain"
}
