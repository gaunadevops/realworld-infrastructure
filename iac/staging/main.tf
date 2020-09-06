terraform {
  backend "azurerm" {}
}

locals {
  environment_name    = "staging"
  resource_group_name = "rg-realworld-${local.environment_name}-001"
  cluster_name        = "azaks-realworld-${local.environment_name}-001"
  location            = "eastus"
  node_count          = 3
}

provider "azurerm" {
  version = "~>2.26"
}

provider "azuread" {
  version = "~>0.7"
}

module "cluster" {
  source = "../modules/aks-cluster"

  location                            = local.location
  node_count                          = local.node_count
  environment                         = local.environment_name
  resource_group_name                 = local.resource_group_name
  aks_service_principal_client_id     = var.aks_service_principal_client_id
  aks_service_principal_client_secret = var.aks_service_principal_client_secret
  cluster_name                        = local.cluster_name
  dns_prefix                          = local.cluster_name
  acr_resource_id                     = var.acr_resource_id
}
