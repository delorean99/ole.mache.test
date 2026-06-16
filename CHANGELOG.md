# Changelog

All notable changes to this project will be documented in this file.

## [1.0.0] - 2024-01-XX

### Added
- Initial Gitea module with user, organization, team, and repository management
- Support for SSH keys and repository templates
- Terragrunt configurations for staging and production environments

### Changed
- Extracted provider configuration to separate providers.tf file
- Refactored team member handling to use proper iteration pattern
- Fixed variable naming inconsistencies (owner -> org)

### Security
- Added sensitive flag to gitea_token variable
- Token now read from environment variable in production
