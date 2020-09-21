# GitHub Organization Automation Project

### **Description**
This project has been written by using `Terraform` and automates GitHub organization teams and settings for your Github account. You can create teams with members, a repository for the teams with the specific options like protecting `master` branch, adding branch rules by using the `Infrastructure as Code` practices.

Features:
- Creates `organization teams with members` in a specific GitHub organization
- Creates `repositories with specific features`
- Creates `labels` for issues

### **Is this project suitable for Production?**
Yes, you can use this project for managing and controling your GitHub organizations.

### **Requirements**
- Terraform v0.13.3 or later: https://www.terraform.io/downloads.html
- A GitHub account
- An existing organization in your GitHub account
- The following `environment variables`. For more information: https://www.terraform.io/docs/providers/github/index.html
   - `GITHUB_TOKEN`: A GitHub OAuth / Personal Access Token.
   - `GITHUB_OWNER`: This is the target GitHub individual account to manage.
   - `GITHUB_ORGANIZATION`: This is the target GitHub organization account to manage.

### **Project Structure**
```
.
├── LICENSE
├── README.md
├── main.tf
├── modules
│   └── github
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── outputs.tf
```

### **Example Usage**
`Step 1-` Define the environment variables
```
export GITHUB_TOKEN=xxxx
export GITHUB_OWNER=xxxx
export GITHUB_ORGANIZATION=xxxx
```
`Step 2-` Create team, users and repository by using module
```
# Create DevOps Team 
module "team_devops" {
  source = "./modules/github"

  name               = "DevOps Team"
  description        = "DevOps Team"
  privacy            = "closed" #closed|secret
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

...

...

```

`Step 3-` Run the following command to apply changes to your GitHub account

```
terraform init && terraform apply
```

### **Example Organization Structure on Github**
```
Existing organization
|
|-- DevOps Team
|  |  |_ User1
|  |  |_ User2
|  |   
|  |---DevOps-Repository
|        |_ Read-write
|        |_ Issues enabled
|        |_ Labels: Bug, Feature
|        |_ Automatic purge for merged branch
|        |_ Protect master branch
|        |_ 2 team member approval
|
|
|-- Infrastructure Team
|  |   |_ User3
|  |   |_ User4
|  |   
|  |---Infrastructure-Repository
|        |_ Read-write
|        |_ Issues enabled
|        |_ Labels: Bug, Feature
|        |_ Automatic purge for merged branch
|        |_ Protect master branch
|        |_ 2 team member approval

```

### **License**


Apache License 2.0
