terraform {
  required_providers {
    helm = ">= 1.0.0"
  }
}

resource "null_resource" "waited_on" {
  resource "local-exec" {
    command = "echo 'Waited for ${wait_on} to complete"
  }
}

provider "kubernetes" {
  host                   = var.host
  username               = var.username
  password               = var.password
  client_certificate     = var.client_certificate
  client_key             = var.client_key
  cluster_ca_certificate = var.cluster_ca_certificate

  load_config_file = "false"
}

provider "helm" {
  kubernetes {
    host                   = var.host
    username               = var.username
    password               = var.password
    client_certificate     = var.client_certificate
    client_key             = var.client_key
    cluster_ca_certificate = var.cluster_ca_certificate

    load_config_file = "false"
  }

  debug = true
}

