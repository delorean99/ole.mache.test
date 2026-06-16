include {
  path = find_in_parent_folders()
}

inputs = {
  users = [
    {
      username = "admin"
      email    = "admin@example.com"
      full_name = "Admin User"
      is_admin = true
    },
    {
      username = "tester1"
      email    = "test1@example.com"
      full_name = "Tester One"
    }
  ]
  
  organizations = [
    {
      name        = "staging-org"
      description = "Staging organization"
    }
  ]
  
  repositories = [
    {
      name        = "infrastructure"
      org         = "staging-org"
      private     = true
      description = "Staging infrastructure code"
    },
    {
      name        = "app-testing"
      org         = "staging-org"
      private     = true
      description = "Testing repository"
    }
  ]
}
