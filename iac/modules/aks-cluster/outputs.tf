output "client_certificate" {
  value = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate)
  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
}

output "cluster_ca_certificate" {
  value = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.cluster_ca_certificate)
  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
}

output "client_key" {
  value = base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_key)
  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
}

output "host" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
}

output "username" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.username
  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
}

output "password" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.password
  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
}
