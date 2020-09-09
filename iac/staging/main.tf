terraform {
  backend "azurerm" {
    storage_account_name = "stterraformstg001"
    container_name       = "realworld"
    key                  = "staging.terraform.tfstate"
  }
}

provider "azurerm" {
  version = "~>2.26"
  features {}
}

provider "azuread" {
  version = "~>0.7"
}

locals {
  environment_name    = "staging"
  resource_group_name = "rg-realworld-${local.environment_name}-001"
  cluster_name        = "azaks-realworld-${local.environment_name}-001"
  location            = "eastus"
  node_count          = 3
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
  enable_acr                          = false
}
