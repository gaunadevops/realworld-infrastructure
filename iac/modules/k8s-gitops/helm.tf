resource "helm_release" "redis" {
  name  = "redis"
  chart = "stable/redis"
}