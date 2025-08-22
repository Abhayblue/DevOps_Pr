data "azurerm_mssql_server" "serverdata" {

  for_each = var.database
  name                = each.value.server_name
  resource_group_name = each.value.resource_group_name
}