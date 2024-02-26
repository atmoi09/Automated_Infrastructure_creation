


resource "helm_release" "helm_argo" {
  name       = "argo-workflows"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-workflows"


  values = [
    file("${path.module}/argo-values.yaml")
  ]
  set {
    name  = "server.loadBalancerIP"
    value = var.publicip
  }

}

