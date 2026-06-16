output "user_ids" {
  description = "Map of usernames to their Gitea IDs"
  value       = { for user in gitea_user.this : user.username => user.id }
}

output "repository_ids" {
  description = "Map of repository names to their Gitea IDs"
  value       = { for repo in gitea_repository.this : repo.name => repo.id }
}

output "organization_ids" {
  description = "Map of organization names to their Gitea IDs"
  value       = { for org in gitea_org.this : org.name => org.id }
}
