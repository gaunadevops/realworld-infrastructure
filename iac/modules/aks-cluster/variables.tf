variable "cluster_name" {

}

variable "resource_group_name" {

}

variable "environment" {

}

variable "location" {
  default = "East US"
}

variable "node_count" {
  default = 3
}

variable "node_size" {
  default = "Standard_D2_v2"
}

variable "aks_service_principal_client_id" {
  type = string
}

variable "aks_service_principal_client_secret" {
  type = string
}

variable dns_prefix {
}

variable "enable_acr" {
  type = bool
}

variable "acr_resource_id" {
  default = ""
}

variable "kubernetes_version" {
  type = string
  default = "1.18.6"
}



