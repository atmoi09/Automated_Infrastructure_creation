output "kubelet_identity" {
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
  description = "The kubelet identity."
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
  description = "Name of the AKS cluster"
}

output "aks_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0
  sensitive =  true
  description = "AKS Config object"
}

output "aks_resourg_group" {
  value = azurerm_kubernetes_cluster.aks.resource_group_name
  description = "Resource group name"
  
}


output "aks_public_ip" {
  value = azurerm_public_ip.pubip.ip_address
  description = "Public IP address of the AKS"
  
}