data "azurerm_key_vault" "keyvault" {

for_each = var.sql_server

  name                = each.value.keyvault_name
  resource_group_name = each.value.resource_group
}

data "azurerm_key_vault_secret" "username" {
  for_each = var.sql_server

  name         = each.value.secret_username
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each = var.sql_server

  name         = each.value.secret_password
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}