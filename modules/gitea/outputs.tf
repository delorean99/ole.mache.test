output "user_names" {
  description = "List of created user usernames"
  value       = [for user in gitea_user.this : user.username]
}

output "repository_names" {
  description = "List of created repository names"
  value       = [for repo in gitea_repository.this : repo.name]
}
