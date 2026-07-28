resource "github_repository" "example" {

  # Repository name on GitHub
  name = var.repository_name

  # Short description shown on the GitHub repository page
  description = var.repository_description

  # Repository visibility:
  # "public"  = anyone can see it
  # "private" = only invited users can see it
  visibility = var.repository_visibility

  # Automatically create the first commit with a README file
  auto_init = var.auto_init

  # Enable GitHub Issues for tracking bugs, tasks, and feature requests
  has_issues = var.repository_features.has_issues

  # Enable GitHub Discussions for questions and community-style conversations
  has_discussions = var.repository_features.has_discussions

  # Enable the repository Wiki
  has_wiki = var.repository_features.has_wiki

  # Allow pull requests to be merged using a merge commit
  allow_merge_commit = true

  # Allow pull requests to be merged by squashing all commits into one commit
  allow_squash_merge = true

  # Allow pull requests to be merged by rebasing commits onto the target branch
  allow_rebase_merge = true

}