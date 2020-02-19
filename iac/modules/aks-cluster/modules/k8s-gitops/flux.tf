resource "kubernetes_namespace" "flux" {	
  metadata {	
    name = "flux"	
  }	
}

# resource "helm_repository" "fluxcd" {
#     name = "fluxcd"
#     url  = "https://charts.fluxcd.io" 
# }

# resource "helm_release" "flux" {
#   name  = "flux"
#   namespace = "flux"
#   chart = "fluxcd/flux"

#   set {
#       name = "git.url"
#       value = "https://github.com/fgauna12/flux-get-started.git"
#   }

#   repository = helm_repository.fluxcd.metadata.0.name
# }

# resource "helm_release" "helm_operator" {
#   name  = "helm-operator"
#   namespace = "flux"
#   chart = "fluxcd/helm-operator"

#   set {
#       name = "git.ssh.secretName"
#       value = "flux-git-deploy"
#   }

#   set {
#       name = "helm.versions"
#       value = "v3"
#   }

#   repository = helm_repository.fluxcd.metadata.0.name
# }

# resource "null_resource" "flux_helm_crd" {
#   provisioner "local-exec" {
#     command = "kubectl apply -f https://raw.githubusercontent.com/fluxcd/helm-operator/master/deploy/flux-helm-release-crd.yaml"
#   }
# }