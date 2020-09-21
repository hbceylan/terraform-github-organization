# Create DevOps Team 
module "team_devops" {
  source = "./modules/github"

  name               = "DevOps Team"
  description        = "DevOps Team"
  privacy            = "closed"
  repo_name          = "devops-repo"
  repo_permission    = "push"
  review_count       = 2
  protection_branch  = "master"
  gitignore_template = "Terraform"
  repo_license       = "mit"

  members = [
    "user1",
    "user2",
  ]

  labels = {
    Bug     = "5ef2a5",
    Feature = "e99695",
  }
}

# Create Infrastructure Team
module "team_infrastructure" {
  source = "./modules/github"

  name               = "Infrastructure Team"
  description        = "Infrastructure Team"
  privacy            = "closed"
  repo_name          = "infrastructure-repo"
  repo_permission    = "push"
  review_count       = 2
  protection_branch  = "master"
  gitignore_template = "Terraform"
  repo_license       = "mit"

  members = [
    "user3",
    "user4",
  ]

  labels = {
    Bug     = "5ef2a5",
    Feature = "e99695",
  }
}

# Create Frontend Team
module "team_frontend" {
  source = "./modules/github"

  name               = "Frontend Team"
  description        = "Frontend Team"
  privacy            = "closed"
  repo_name          = "frontend-repo"
  repo_permission    = "push"
  review_count       = 2
  protection_branch  = "master"
  gitignore_template = "Terraform"
  repo_license       = "mit"

  members = [
    "user5",
    "user6",
  ]

  labels = {
    Bug     = "5ef2a5",
    Feature = "e99695",
  }
}

# Create Managers Team
module "team_managers" {
  source = "./modules/github"

  name               = "Managers Team"
  description        = "Managers Team"
  privacy            = "closed"
  repo_name          = "managers-repo"
  repo_permission    = "push"
  review_count       = 2
  protection_branch  = "master"
  gitignore_template = "Terraform"
  repo_license       = "mit"

  members = [
    "user7",
    "user8",
  ]

  labels = {
    Bug     = "5ef2a5",
    Feature = "e99695",
  }
}