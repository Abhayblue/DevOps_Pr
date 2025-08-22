data "azurerm_subnet" "subnetid" {

  for_each = var.virtual_machine

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_key_vault" "keyvault" {

  for_each = var.virtual_machine
  
  name                = each.value.keyvault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "username" {

  for_each = var.virtual_machine

  name         = each.value.secret_username
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}

data "azurerm_key_vault_secret" "password" {

  for_each = var.virtual_machine

  name         = each.value.secret_password
  key_vault_id = data.azurerm_key_vault.keyvault[each.key].id
}

data "azurerm_public_ip" "pip_id" {
  
  for_each = var.virtual_machine

  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}