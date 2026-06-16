output "user_ids" {
  description = "Map of usernames to their Gitea IDs"
  value       = { for user in gitea_user.this : user.username => user.id }
}

output "organization_ids" {
  description = "Map of organization names to their Gitea IDs"
  value       = { for org in gitea_org.this : org.name => org.id }
}

output "team_ids" {
  description = "Map of team identifiers to their Gitea IDs"
  value       = { for team in gitea_team.this : team.name => team.id }
}

output "repository_ids" {
  description = "Map of repository names to their Gitea IDs"
  value       = { for repo in gitea_repository.this : repo.name => repo.id }
}

output "repository_urls" {
  description = "Map of repository names to their clone URLs"
  value       = { for repo in gitea_repository.this : repo.name => repo.http_url }
}
