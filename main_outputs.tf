output "aks_name_main" {
  value = module.aks.aks_name
  description = "Name of the AKS cluster"
}
output "aks_public_ip_main" {
  value = module.aks.aks_public_ip
  description = "Public IP address of the AKS"
}