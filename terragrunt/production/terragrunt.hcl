include {
  path = find_in_parent_folders()
}

# Production best practices: explicit configuration
inputs = {
  gitea_url  = "https://gitea.company.com"
  gitea_token = get_env("GITEA_TOKEN", "")
  
  # Fail if token is not set
  users = [
    {
      username = "admin"
      email    = "admin@company.com"
      full_name = "Admin User"
      is_admin = true
    }
  ]
  
  organizations = [
    {
      name        = "engineering"
      description = "Engineering team"
      visibility  = "private"
    }
  ]
  
  repositories = [
    {
      name           = "infrastructure"
      org            = "engineering"
      private        = true
      description    = "Infrastructure as Code"
      auto_init      = true
      default_branch = "main"
    }
  ]
}

# Production best practices: prevent accidental destruction
prevent_destroy = true

# Production best practices: retry on transient errors
retryable_errors = [
  "Failed to instantiate: Request forbidden",
  "connection refused",
  "timeout"
]
