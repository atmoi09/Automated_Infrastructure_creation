# Create a PostgreSQL Server
resource "azurerm_postgresql_server" "postgresql-server" {
  name = "pgsqlserver-${var.app_name}"
  location = var.location
  resource_group_name = var.resource_group_name
  administrator_login          = var.postgre_login_username
  administrator_login_password = var.postgre_login_password
 
  sku_name = var.pgsql_sku_name
  version  = var.pgsql_version
 
  storage_mb        = var.storagesize_mb
  auto_grow_enabled = true
  
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  public_network_access_enabled     = var.public_network_access_enabled
  ssl_enforcement_enabled           = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version_enforced
}

# Create a PostgreSQL Database
resource "azurerm_postgresql_database" "postgresql-db" {
  name                =  var.db_name    
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgresql-server.name
  charset             = "utf8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_firewall_rule" "allow_all" {
  name                = "AllowAll"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgresql-server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}



