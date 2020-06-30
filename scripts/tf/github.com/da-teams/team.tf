locals {
  members = { for v in var.members : v => v }
}

resource "github_team" "team" {
  name           = var.group_name
  privacy        = var.privacy
  parent_team_id = var.parent_team_id
}

resource "github_team_membership" "member" {
  for_each = local.members
  team_id  = github_team.team.id
  username = each.value
  role     = var.group_role
}
