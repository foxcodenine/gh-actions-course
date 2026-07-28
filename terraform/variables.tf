variable "repository_name" {
  description = "Name of the GitHub repository."
  type        = string
  default     = "gh-actions-course"
}

variable "repository_description" {
  description = "Short description displayed on GitHub."
  type        = string
  default     = "Repository containing examples and notes for the GitHub Actions Udemy course."
}

variable "repository_visibility" {
  description = "Repository visibility: public or private."
  type        = string
  default     = "public"

  validation {
    condition     = contains(["public", "private"], var.repository_visibility)
    error_message = "Repository visibility must be either public or private."
  }
}

variable "auto_init" {
  description = "Whether GitHub should create the initial README commit."
  type        = bool
  default     = true
}

variable "repository_features" {
  description = "GitHub repository features to enable."

  type = object({
    has_issues      = bool
    has_discussions = bool
    has_wiki        = bool
  })

  default = {
    has_issues      = true
    has_discussions = true
    has_wiki        = false
  }
}
