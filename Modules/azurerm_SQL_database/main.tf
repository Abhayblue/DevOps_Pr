resource "azurerm_mssql_database" "SQL_DB" {

  for_each = var.database
  
  name         = each.value.db_name
  server_id    = data.azurerm_mssql_server.serverdata[each.key].id
 
}

