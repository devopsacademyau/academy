resource "github_team" "team" {
  name    = var.group_name
  privacy = "closed"
}

resource "github_team_membership" "member" {
  count    = length(var.members)
  team_id  = github_team.team.id
  username = var.members[count.index]
  role     = "maintainer"
}


resource "github_team_repository" "team_repo" {
  team_id    = github_team.team.id
  repository = github_repository.repo.name
  permission = "maintain"
}
