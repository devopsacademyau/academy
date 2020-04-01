resource "github_repository" "repo" {
  name         = var.group_name

  private      = false
  has_projects = true

  template {
    owner      = "devopsacademyau"
    repository = "projects-template"
  }
}

resource "github_team_repository" "admins_access" {
  team_id    = var.admins_team_id
  repository = github_repository.repo.name
  permission = "admin"
}

resource "github_repository_file" "README" {
  repository = github_repository.repo.name
  file       = "README.md"
  content    = var.group_name
}

resource "github_repository_file" "CODEOWNERS" {
  repository = github_repository.repo.name
  file       = "docs/CODEOWNERS"
  content    = "@devopsacademyau/admin @devopsacademyau/instructors @devopsacademyau/${var.group_name}"
}

resource "github_branch_protection" "master-protected" {
  repository     = github_repository.repo.name
  branch         = "master"
  enforce_admins = true
  depends_on     = [
    github_repository_file.README,
    github_repository_file.CODEOWNERS
    ]

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
    dismissal_teams            = ["devopsacademyau/admin"]
  }

  restrictions {
    teams = ["devopsacademyau/admin", "devopsacademyau/instructors"]
  }
}

resource "github_repository_project" "project" {
  name       = var.group_name
  repository = github_repository.repo.name
}

resource "github_project_column" "Backlog" {
  project_id = github_repository_project.project.id
  name       = "Backlog"
}

resource "github_project_column" "InProgress" {
  project_id = github_repository_project.project.id
  name       = "In Progress"
}

resource "github_project_column" "Review" {
  project_id = github_repository_project.project.id
  name       = "Review"
}

resource "github_project_column" "Done" {
  project_id = github_repository_project.project.id
  name       = "Done"
}
