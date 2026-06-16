terraform {
  required_version = ">= 1.0"
  
  required_providers {
    gitea = {
      source  = "go-gitea/gitea"
      version = "~> 0.10"
    }
  }
}
