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
