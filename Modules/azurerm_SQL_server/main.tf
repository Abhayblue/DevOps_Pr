resource "azurerm_mssql_server" "sql_server" {

for_each = var.sql_server

  name                         = each.value.server_name
  resource_group_name          = each.value.resource_group
  location                     = each.value.server_location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.username[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.password[each.key].value
  minimum_tls_version          = "1.2"

}


