resource "azurerm_network_interface" "nic" {

for_each = var.virtual_machine

  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnetid[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.pip_id[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "virtual_machine" {

  for_each = var.virtual_machine

  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.vm_location
  size                = each.value.vm_size
  admin_username      = data.azurerm_key_vault_secret.username[each.key].value
  admin_password      = data.azurerm_key_vault_secret.password[each.key].value

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {

    
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.osversion
  }

    custom_data = base64encode(<<EOT
#cloud-config
package_update: true
packages:
  - nginx
runcmd:
  - systemctl enable nginx
  - systemctl start nginx
EOT
  )
}