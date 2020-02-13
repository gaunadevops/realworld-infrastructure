module "fluxcd" {
  source  = "jacops/fluxcd/kubernetes"
  version = "0.2.2"
  namespace = "flux"
  generate_ssh_key    = true
  flux_values         = {
    git = {
      pollInterval: "1m"
      url: "git@github.com:fgauna12/flux-get-started"
    }
  }
}

resource "github_repository_deploy_key" "aks_cluster_state" {
  key        = module.fluxcd.git_ssh_public_key
  repository = "cicd-cluster-state"
  title      = "aks_cluster_state"
}