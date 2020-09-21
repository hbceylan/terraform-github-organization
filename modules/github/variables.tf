variable "name" {
  description = "The name of the team."
  type        = string
}

variable "description" {
  description = "A description of the team."
  type        = string
  default     = ""
}

variable "privacy" {
  description = "The level of privacy for the team. Must be one of secret or closed. Defaults to secret."
  type        = string
  default     = "secret"
}

variable "members" {
  description = "A list of users that will be added to the current team with member permissions."
  type        = set(string)
  default     = []
}

variable "repo_name" {
  description = "The name of the repository."
  type        = string
}

variable "repo_permission" {
  description = "The permission of the repository."
  type        = string
}

variable "labels" {
  type        = map
  description = "List of labels"
  default     = {}
}

variable "review_count" {
  type        = string
  description = "Review count"
  default     = ""
}

variable "protection_branch" {
  type        = string
  description = "Protection branch"
  default     = ""
}

variable "gitignore_template" {
  type        = string
  description = "gitignore template"
  default     = ""
}

variable "repo_license" {
  type        = string
  description = "Repo license"
  default     = ""
}