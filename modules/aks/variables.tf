variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "app_name" {
  type        = string
  description = "Application name. Use only lowercase letters and numbers"
}

variable "location" {
  type        = string
  description = "Azure region where to create resources."
}


variable "acr_id" {
  type        = string
  description = "Azure container registry ID to pull images from."
}

variable "key_vault_id" {
  type        = string
  description = "Application key vault ID"
}


### AKS configuration params ###
variable "kubernetes_version" {
  type = string
  description = "Version of your kubernetes node pool"
}

variable "vm_size_node_pool" {
  type = string
  description = "VM Size of your node pool"
}

variable "node_pool_min_count" {
  type = string
  description = "VM minimum amount of nodes for your node pool"
}

variable "node_pool_max_count" {
  type = string
  description = "VM maximum amount of nodes for your node pool"
}



