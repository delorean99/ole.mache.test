variable "gitea_url" {
  description = "Gitea server URL"
  type        = string
}

variable "gitea_token" {
  description = "Gitea API token"
  type        = string
  sensitive   = true
}

variable "users" {
  description = "List of users to create"
  type = list(object({
    username     = string
    email        = string
    password     = optional(string)
    ssh_key      = optional(string)
    full_name    = optional(string)
    is_admin     = optional(bool, false)
  }))
  default = []
}

variable "organizations" {
  description = "List of organizations to create"
  type = list(object({
    name        = string
    description = optional(string)
    visibility  = optional(string, "private")
    website     = optional(string)
  }))
  default = []
}

variable "teams" {
  description = "List of teams to create"
  type = list(object({
    name       = string
    org        = string
    permission = optional(string, "read")
    members    = optional(list(string), [])
  }))
  default = []
}

variable "repositories" {
  description = "List of repositories to create"
  type = list(object({
    name           = string
    org            = string
    template       = optional(string)
    description    = optional(string)
    private        = optional(bool, true)
    auto_init      = optional(bool, false)
    gitignore      = optional(string)
    license        = optional(string)
    default_branch = optional(string, "main")
  }))
  default = []
}

variable "repository_templates" {
  description = "List of repository templates to create"
  type = list(object({
    name        = string
    description = optional(string)
    content     = optional(map(string), {})
  }))
  default = []
}
