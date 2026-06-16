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
      username = "tester1"
      email    = "test1@example.com"
      name     = "Tester One"
    }
  ]
  
  repositories = [
    {
      name        = "infrastructure"
      owner       = "admin"
      private     = true
      description = "Staging infrastructure code"
    },
    {
      name        = "app-testing"
      owner       = "tester1"
      private     = true
      description = "Testing repository"
    }
  ]
}
