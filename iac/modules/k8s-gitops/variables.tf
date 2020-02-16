resource "null_resource" "waited_on" {
  resource "local-exec" {
    command = "echo 'Waited for ${wait_on} to complete"
  }
}

variable "host" {
    
}

variable "username" {

}

variable "password" {

}

variable "client_certificate" {

}

variable "client_key" {

}

variable "cluster_ca_certificate" {
    
}