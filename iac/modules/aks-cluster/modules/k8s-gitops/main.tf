terraform {
  required_providers {
    helm = ">= 1.0.0"
  }
}

provider "kubernetes" {
  host                   = module.cluster.host
  username               = module.cluster.username
  password               = module.cluster.password
  client_certificate     = module.cluster.client_certificate
  client_key             = module.cluster.client_key
  cluster_ca_certificate = module.cluster.cluster_ca_certificate  

  load_config_file = "false"
}

provider "helm" {
  kubernetes {
    host                   = module.cluster.host
    username               = module.cluster.username
    password               = module.cluster.password
    client_certificate     = module.cluster.client_certificate
    client_key             = module.cluster.client_key
    cluster_ca_certificate = module.cluster.cluster_ca_certificate

    load_config_file = "false"
  }

  debug = true
}

