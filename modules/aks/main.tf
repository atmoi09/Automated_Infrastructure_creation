

# Allow the AKS to pull images from ACR
resource "azurerm_role_assignment" "aks_acr_pull_role" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity.0.object_id
}

# Kubernetes Service
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.app_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-${var.app_name}"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    type                = "VirtualMachineScaleSets"
    name                = "default"
    node_count          = var.node_pool_min_count
    vm_size             = var.vm_size_node_pool
    os_disk_size_gb     = 30
    enable_auto_scaling = true
    max_count           = var.node_pool_max_count
    min_count           = var.node_pool_min_count
    
  }

  network_profile {
    network_plugin = "azure"
  }
  identity {
    type = "SystemAssigned"
  }
}


resource "azurerm_public_ip" "pubip" { 
  name                         = "argo-workflows-ip"
  location                     = "northeurope"
  resource_group_name          = "mc_${var.resource_group_name}_${azurerm_kubernetes_cluster.aks.name}_${var.location}"
  allocation_method            = "Static"
  sku                          = "Standard"
  tags = {
      environment = "Dev"
    }
  depends_on = [ azurerm_kubernetes_cluster.aks ]
}




resource "kubernetes_namespace" "argo" {
  metadata {
    name = "argo"
  }
}
resource "kubernetes_namespace" "argo-events" {
  metadata {
    name = "argo-events"
  }
}

