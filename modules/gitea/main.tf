# Users
resource "gitea_user" "this" {
  for_each = { for user in var.users : user.username => user }
  
  username     = each.value.username
  email        = each.value.email
  password     = each.value.password
  full_name    = each.value.full_name
  is_admin     = each.value.is_admin
}

# SSH Keys
resource "gitea_user_ssh_key" "this" {
  for_each = { 
    for user in var.users : 
    user.username => user 
    if lookup(user, "ssh_key", null) != null 
  }
  
  title   = "${each.value.username}-key"
  key     = each.value.ssh_key
  user_id = gitea_user.this[each.key].id
}

# Organizations
resource "gitea_org" "this" {
  for_each = { for org in var.organizations : org.name => org }
  
  name        = each.value.name
  description = each.value.description
  visibility  = each.value.visibility
  website     = each.value.website
}

# Teams
resource "gitea_team" "this" {
  for_each = { for team in var.teams : "${team.org}-${team.name}" => team }
  
  name       = each.value.name
  org        = gitea_org.this[each.value.org].id
  permission = each.value.permission
}

# Team Members
resource "gitea_team_member" "this" {
  for_each = {
    for pair in flatten([
      for team in var.teams : [
        for member in lookup(team, "members", []) : {
          team_key  = "${team.org}-${team.name}"
          username  = member
        }
      ]
    ]) : "${pair.team_key}-${pair.username}" => pair
  }
  
  team_id  = gitea_team.this[each.value.team_key].id
  username = each.value.username
}

# Repositories
resource "gitea_repository" "this" {
  for_each = { for repo in var.repositories : "${repo.org}-${repo.name}" => repo }
  
  name           = each.value.name
  org            = gitea_org.this[each.value.org].id
  description    = each.value.description
  private        = each.value.private
  auto_init      = each.value.auto_init
  gitignore      = each.value.gitignore
  license        = each.value.license
  default_branch = each.value.default_branch
  
  # Template support
  template = each.value.template != null ? {
    repo = each.value.template
  } : null
}

# Repository Templates (as special repos)
resource "gitea_repository" "templates" {
  for_each = { for tmpl in var.repository_templates : tmpl.name => tmpl }
  
  name        = each.value.name
  description = each.value.description
  private     = true
  auto_init   = true
  
  # Initialize with template content
  lifecycle {
    ignore_changes = [template]
  }
}
