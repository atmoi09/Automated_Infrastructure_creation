
# ------------------------------------------------
# Create a common Key Vault to store application secrets
# ------------------------------------------------
module "keyvault" {
  source = "./modules/key_vault"

  name                = "kv1-${var.app_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  # Config
  enabled_for_deployment          = "true"
  enabled_for_disk_encryption     = "true"
  enabled_for_template_deployment = "true"
}

# ------------------------------------------------
# Create the Azure Container Registry
# ------------------------------------------------
module "acr" {
  source = "./modules/acr"

  name                = "acr${var.app_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
}


# ------------------------------------------------
# Create AKS Cluster
# ------------------------------------------------
module "aks" {
  source = "./modules/aks"

  resource_group_name  = var.resource_group_name
  app_name             = var.app_name
  location             = var.location

  acr_id           = module.acr.id
  key_vault_id     = module.keyvault.key_vault_id

  ### AKS configuration params ###
  kubernetes_version  = var.kubernetes_version
  vm_size_node_pool   = var.vm_size_node_pool
  node_pool_min_count = var.node_pool_min_count
  node_pool_max_count = var.node_pool_max_count
}

# ------------------------------------------------
# Create Argo Workflows with Helm
# ------------------------------------------------
module "helm_argo" {
  source = "./modules/helm"

  depends_on = [ module.aks ]
  publicip = module.aks.aks_public_ip
}


# ------------------------------------------------
# Create a PostgreSQL Database server and database
# ------------------------------------------------
module "postgre_database" {
  source = "./modules/database"

  location = var.location
  app_name = var.app_name
  resource_group_name = var.resource_group_name
  postgre_login_username = var.postgre_login_username
  postgre_login_password = var.postgre_login_password
  pgsql_sku_name = var.pgsql_sku_name
  pgsql_version = var.pgsql_version
  storagesize_mb = var.storagesize_mb
  public_network_access_enabled = var.public_network_access_enabled_root
  ssl_enforcement_enabled = var.ssl_enforcement_enabled_root
  ssl_minimal_tls_version_enforced = var.ssl_minimal_tls_version_enforced_root
  db_name = var.db_name
}



