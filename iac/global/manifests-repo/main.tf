provider "github" {
  token = var.github_token
  organization = var.github_organization
}

# Add deploy key
resource "github_repository_deploy_key" "staging_flux_deploy_key" {
  title      = var.github_deploy_key_name
  repository = var.github_repository
  key        = var.staging_ssh_public_key
  read_only  = false
}
