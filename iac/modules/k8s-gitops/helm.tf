resource "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

resource "helm_release" "redis" {
  name  = "redis"
  chart = "stable/redis"

  repository = "https://kubernetes-charts.storage.googleapis.com"
}