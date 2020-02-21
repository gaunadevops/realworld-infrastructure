provider "github" {
  token = var.github_token
  organization = "gaunadevops"
}

# Add deploy key
resource "github_repository_deploy_key" "staging_flux_deploy_key" {
  title      = "Real World Staging Flux"
  repository = "flux-get-started"
  key        = var.staging_ssh_public_key
  read_only  = false
}
