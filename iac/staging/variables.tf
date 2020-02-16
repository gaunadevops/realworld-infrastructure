# variable "aks_service_principal_client_id" {
#   type = string
# }

# variable "aks_service_principal_client_secret" {
#   type = string
# }

variable "service_principal" {	
  type = object({
    client_id     = string	
    client_secret = string	
  })	
}


