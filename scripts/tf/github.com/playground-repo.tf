resource "github_repository" "playground-repository" {
  name         = "playground"

  private      = false
  has_projects = false
  has_issues   = false

  template {
    owner      = "devopsacademyau"
    repository = "projects-template"
  }
}

resource "github_team_repository" "playground-admins_access" {
  team_id    = module.team-admins.id
  repository = github_repository.playground-repository.name
  permission = "admin"
}

resource "github_team_repository" "playground-instructors_access" {
  team_id    = module.team-instructors.id
  repository = github_repository.playground-repository.name
  permission = "admin"
}

# resource "github_team_repository" "playground-students_access" {
#   team_id    = module.team-students.team_id
#   repository = github_repository.playground-repository.name
#   permission = "admin"
# }

resource "github_repository_file" "playground-README" {
  repository = github_repository.playground-repository.name
  branch     = "master"
  file       = "README.md"
  content    = "# DevOps Academy Playground\nPlease be respectful with work from others.\n\nAny work in this repository should be considered dispensable."
}

resource "github_repository_file" "playground-CODEOWNERS" {
  repository = github_repository.playground-repository.name
  branch     = "master"
  file       = "docs/CODEOWNERS"
  content    = "@devopsacademyau/admin @devopsacademyau/instructors @devopsacademyau/students"
}

resource "github_branch_protection" "playground-master-protected" {
  repository_id  = github_repository.playground-repository.node_id
  pattern        = "master"
  enforce_admins = true
  depends_on     = [
    github_repository_file.playground-README,
    github_repository_file.playground-CODEOWNERS
    ]

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
  }


}
