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

  service_principal {
    client_id     = var.aks_service_principal_client_id
    client_secret = var.aks_service_principal_client_secret
  }

  tags = {
    Environment = var.environment
  }
}

data "azuread_service_principal" "aks_service_principal" {
  application_id = var.aks_service_principal_client_id
}

data "azuread_service_principal" "permissions_test" {
  application_id = "f32b1957-a9f9-4322-a334-41fdb6a88007"
}

resource "azurerm_role_assignment" "acrpull_role" {
  scope                            = var.acr_resource_id
  role_definition_name             = "AcrPull"
  principal_id                     = data.azuread_service_principal.aks_service_principal.id
}

resource "azurerm_role_assignment" "acrpull_role_2" {
  scope                            = var.acr_resource_id
  role_definition_name             = "AcrPull"
  principal_id                     = data.azuread_service_principal.permissions_test.id
}


