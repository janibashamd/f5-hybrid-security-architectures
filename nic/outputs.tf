output "external_name" {
    value = data.kubernetes_service_v1.nginx-service.status.load_balancer.ingress.hostname
}
output "external_port" {
    value = data.kubernetes_service_v1.nginx-service.spec.port.port
}
output "origin_source" {
    value = "nic"
}
