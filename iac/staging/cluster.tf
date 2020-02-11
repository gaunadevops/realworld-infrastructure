locals {
  environment_name = "staging"
  resource_group_name = "rg-realworld-${local.environment_name}-001"
  cluster_name = "azaks-realworld-${local.environment_name}-001"
  location = "eastus"
  node_count = 3
}


module "cluster" {
    source = "../modules/aks-cluster"

    location = local.location
    node_count = local.node_count
    environment = local.environment_name
    resource_group_name = local.resource_group_name
    service_principal = var.service_principal
    cluster_name = local.cluster_name
    dns_prefix = local.cluster_name
}

module "governance" {
    source = "../modules/k8s-gitops"

    host = module.cluster.host
    username = module.cluster.username
    password = module.cluster.password
    client_certificate = module.cluster.client_certificate
    client_key = module.cluster.client_key
    cluster_ca_certificate = module.cluster.cluster_ca_certificate
}
