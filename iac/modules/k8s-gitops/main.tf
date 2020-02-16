terraform {
  required_providers {
    helm = ">= 1.0.0"
  }
}

resource "null_resource" "waited_on" {
  provisioner "local-exec" {
    command = "Waiting on ${var.host} to provision"
  }
}

resource "local_file" "kube_config" {
  # HACK: depends_on for the helm provider
  # Passing provider configuration value via a local_file
  depends_on = [null_resource.waited_on]
  content    = "${var.kube_config}"
  filename   = "./terraform.tfstate.helmprovider.kubeconfig"
}

provider "kubernetes" {
  # host                   = var.host
  # username               = var.username
  # password               = var.password
  # client_certificate     = var.client_certificate
  # client_key             = var.client_key
  # cluster_ca_certificate = var.cluster_ca_certificate

  # load_config_file = "false"
  config_path = "${local_file.kube_config.filename}"
}

provider "helm" {
  kubernetes {
    # host                   = var.host
    # username               = var.username
    # password               = var.password
    # client_certificate     = var.client_certificate
    # client_key             = var.client_key
    # cluster_ca_certificate = var.cluster_ca_certificate

    # load_config_file = "false"
    config_path = "${local_file.kube_config.filename}"
  }

  debug = true
}

