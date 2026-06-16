include {
  path = find_in_parent_folders()
}

inputs = {
  gitea_url  = "https://gitea.company.com"
  gitea_token = get_env("GITEA_TOKEN")
  
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
    }
  ]
  
  repositories = [
    {
      name        = "infrastructure"
      org         = "engineering"
      private     = true
      description = "Infrastructure as Code"
    }
  ]
}
