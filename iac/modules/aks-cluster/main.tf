resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_size
  }

  kubernetes_version = var.kubernetes_version

  service_principal {
    client_id     = var.aks_service_principal_client_id
    client_secret = var.aks_service_principal_client_secret
  }

  tags = {
    Environment = var.environment
  }
}

data "azuread_service_principal" "aks_service_principal" {
  count          = var.enable_acr ? 1 : 0
  application_id = var.aks_service_principal_client_id
}

resource "azurerm_role_assignment" "acrpull_role" {
  count                = var.enable_acr ? 1 : 0
  scope                = var.acr_resource_id
  role_definition_name = "AcrPull"
  principal_id         = data.azuread_service_principal.aks_service_principal[count.index].id
}

