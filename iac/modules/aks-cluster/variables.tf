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

variable "service_principal" {
  type = object({
    client_id     = string
    client_secret = string
  })
  description = "The service principal to use"
}

variable dns_prefix {
  default = var.cluster_name
}




