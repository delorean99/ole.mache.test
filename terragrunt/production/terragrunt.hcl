include {
  path = find_in_parent_folders()
}

inputs = {
  users = [
    {
      username = "admin"
      email    = "admin@example.com"
      name     = "Admin User"
      is_admin = true
    },
    {
      username = "developer1"
      email    = "dev1@example.com"
      name     = "Developer One"
    }
  ]
  
  repositories = [
    {
      name        = "infrastructure"
      owner       = "admin"
      private     = true
      description = "Production infrastructure code"
    },
    {
      name        = "app-backend"
      owner       = "developer1"
      private     = true
      description = "Backend application repository"
    }
  ]
}
