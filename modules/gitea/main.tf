provider "gitea" {
  base_url = var.gitea_url
  token    = var.gitea_token
}

# Create organization if specified
resource "gitea_org" "this" {
  for_each = { for org in var.organizations : org.name => org }
  
  name        = each.value.name
  description = each.value.description
}

# Create teams within organizations
resource "gitea_team" "this" {
  for_each = { for team in var.teams : "${team.org}-${team.name}" => team }
  
  name       = each.value.name
  org        = gitea_org.this[each.value.org].id
  permission = each.value.permission
}
