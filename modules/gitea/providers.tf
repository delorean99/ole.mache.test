terraform {
  required_providers {
    gitea = {
      source  = "go-gitea/gitea"
      version = "~> 0.10"
    }
  }
}

provider "gitea" {
  base_url = var.gitea_url
  token    = var.gitea_token
}
