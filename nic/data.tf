data "tfe_outputs" "infra" {
  organization = var.tf_cloud_organization
  workspace = "infra"
}
data "tfe_outputs" "eks" {
  organization = var.tf_cloud_organization
  workspace = "eks"
}
data "aws_eks_cluster_auth" "auth" {
  name = data.tfe_outputs.eks.values.cluster_name
}
data "kubernetes_service_v1" "nginx-service" {
  metadata {
    #name = format("%s-%s", helm_release.nginx-plus-ingress.name, helm_release.nginx-plus-ingress.chart)
    name = "onewaf-nic-0b0d-nginx-ingress-controller"
    namespace = helm_release.nginx-plus-ingress.namespace
  }
}

