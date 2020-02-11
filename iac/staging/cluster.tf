locals {
  environment_name = "staging"
  resource_group_name = "rg-realworld-${locals.environment_name}-001"
  cluster_name = "azaks-realworld-${locals.environment_name}-001"
  location = "eastus"
  node_count = 3
}


module "cluster" {
    source = "../modules/aks-cluster"

    location = locals.location
    node_count = locals.node_count
    environment = locals.environment_name
    resource_group_name = locals.resource_group_name
    service_principal = var.service_principal
    cluster_name = locals.cluster_name
    dns_prefix = locals.cluster_name
}
