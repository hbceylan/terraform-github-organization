locals {
  members = { for i in var.members : lower(i) => "member" }
}

resource "github_team" "default" {
  name        = var.name
  description = var.description
  privacy     = var.privacy
}

resource "github_team_membership" "default" {
  for_each = local.members

  team_id  = github_team.default.id
  username = each.key
  role     = each.value
}

resource "github_team_repository" "default" {
  repository = var.repo_name
  team_id    = github_team.default.id
  permission = var.repo_permission
}

resource "github_repository" "default" {
  name                   = var.repo_name
  has_issues             = true
  auto_init              = true
  default_branch         = "master"
  gitignore_template     = var.gitignore_template
  license_template       = var.repo_license
  delete_branch_on_merge = true
}

resource "github_issue_label" "default" {
  for_each = var.labels

  repository = github_repository.default.name
  name       = each.key
  color      = each.value
}

resource "github_branch_protection" "default" {
  repository     = github_repository.default.name
  branch         = var.protection_branch
  enforce_admins = true

  required_pull_request_reviews {
    required_approving_review_count = var.review_count
  }
}