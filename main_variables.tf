### General ###
variable "app_name" {
  type        = string
  description = "Application name. Use only lowercase letters and numbers"
}

variable "location" {
  type        = string
  description = "Azure region where to create resources."
}

variable "domain_name_label" {
  type        = string
  description = "Unique domain name label for AKS Cluster / Application Gateway"
}


variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the resources"
}
variable "resource_group_location" {
  type        = string
  description = "The location of the resource group in which to create the resources"
}




variable "client_id" {
  description = "The Azure client ID"
  type        = string
}
variable "client_secret" {
  description = "The Azure client secret"
  type        = string

}
variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}
variable "tenant_id" {
  description = "The Azure tenant ID"
  type        = string
}


### AKS configuration params ###
variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version of the node pool"
  default     = "1.27.7"
}

variable "vm_size_node_pool" {
  type        = string
  description = "VM Size of the node pool"
  default     = "Standard_DS2_v2"
}

variable "node_pool_min_count" {
  type        = string
  description = "VM minimum amount of nodes for the node pool"
  default     = 1
}

variable "node_pool_max_count" {
  type        = string
  description = "VM maximum amount of nodes for the node pool"
  default     = 1
}



# Azure PostgreSQL Server
variable "administrator_login" {
  type        = string
  description = "The administrator login name for the PostgreSQL Server"
  default     = "pgadmin"
}
variable "administrator_login_password" {
  type        = string
  description = "The administrator login password for the PostgreSQL Server"
  default     = "FCbarca979797" 
}
variable "sku_name" {
  type        = string
  description = "The name of the SKU used by this PostgreSQL Server"
  default     = "B_Gen5_1" 
}
variable "pgsql_version" {
  type        = string
  description = "The version of the PostgreSQL Server"
  default     = "11" 
}
variable "storagesize_mb" {
  type        = string
  description = "The storage size of the PostgreSQL Server"
  default     = "51200" 
}
variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this PostgreSQL Server"
  default     = true
}
variable "ssl_enforcement_enabled" {
  type        = bool
  description = "Whether or not SSL should be enforced by the PostgreSQL Server"
  default     = true
}
variable "ssl_minimal_tls_version_enforced" {
  type        = string
  description = "The minimal TLS version to be used by the PostgreSQL Server"
  default     = "TLS1_2" 
}

# Azure PostgreSQL Database
variable "postgre_login_username" {
  type        = string
  description = "The Administrator Login for the PostgreSQL Server"
}
variable "postgre_login_password" {
  type        = string
  description = "The Administrator Login Password for the PostgreSQL Server"
}
variable "db_name" {
  type        = string
  description = "The name of the PostgreSQL Database"
}
variable "pgsql_sku_name" {
  type        = string
  description = "The name of the SKU used by this PostgreSQL Server"
}
variable "public_network_access_enabled_root" {
  type        = bool
  description = "Whether or not public network access is allowed for this PostgreSQL Server"  
}
variable "ssl_enforcement_enabled_root" {
  type        = bool
  description = "Whether or not SSL enforcement is enabled for this PostgreSQL Server"
}
variable "ssl_minimal_tls_version_enforced_root" {
  type        = string
  description = "The minimal TLS version to be used by this PostgreSQL Server"
}