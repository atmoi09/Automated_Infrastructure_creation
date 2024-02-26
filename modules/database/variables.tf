
variable "app_name" {
  description = "The name of the application"
  type        = string  
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string  
}
variable "location" {
  description = "The location/region where the PostgreSQL Server will be created"
  type        = string  
}
variable "postgre_login_username" {
  description = "The Administrator Login for the PostgreSQL Server"
  type        = string
}
variable "postgre_login_password" {
  description = "The Administrator Login Password for the PostgreSQL Server"
  type        = string
}
variable "pgsql_sku_name" {
  description = "The name of the SKU used by this PostgreSQL Server"
  type        = string
}
variable "pgsql_version" {
  description = "The version of PostgreSQL to use"
  type        = string
}
variable "storagesize_mb" {
  description = "The maximum storage allowed for this PostgreSQL Server"
  type        = number
}
variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this PostgreSQL Server"
  type        = bool
}
variable "ssl_enforcement_enabled" {
  description = "Whether or not SSL enforcement is enabled for this PostgreSQL Server"
  type        = bool
}
variable "ssl_minimal_tls_version_enforced" {
  description = "The minimal TLS version to be used by this PostgreSQL Server"
  type        = string
}
variable "db_name" {
  description = "The name of the PostgreSQL Database"
  type        = string
}