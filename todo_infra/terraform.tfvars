todo_rg = {
  resource_group1 = {
    "name"     = "todo_rg"
    "location" = "central India"
  }

  # resource_group2 = {
  #   "name"     = "todo_rg_2"
  #   "location" = "central India"
  # }


}

vnet = {

  vnet1 = {
    vnet_name           = "todo_vnet"
    vnet_location       = "central India"
    resource_group_name = "todo_rg"
    address_space       = ["10.0.0.0/22"]
  }

}

subnet = {
  subnet1 = {
    subnet_name         = "frontend_subnet"
    resource_group_name = "todo_rg"
    vnet_name           = "todo_vnet"
    address_prefixes    = ["10.0.0.0/23"]
  }

  subnet2 = {
    subnet_name         = "backend_subnet"
    resource_group_name = "todo_rg"
    vnet_name           = "todo_vnet"
    address_prefixes    = ["10.0.2.0/23"]
  }

}

pip = {

  pip1 = {
    public_ip_name = "frontend_pip"
    resource_group = "todo_rg"
    pip_location   = "central India"

  }

  pip2 = {
    public_ip_name = "backend_pip"
    resource_group = "todo_rg"
    pip_location   = "central India"

  }

}

server = {

  server1 = {
    server_name     = "todo-sql-server-abhay"
    resource_group  = "todo_rg"
    server_location = "central India"
  
    keyvault_name   = "Vault4444"
    secret_username = "SQLdb-name"
    secret_password = "SQLdb-pwd"
    resource_group  = "todo_rg"
  }

}

database = {

  database1 = {
    db_name             = "todo_db"
    resource_group_name = "todo_rg"
    server_name         = "todo-sql-server-abhay"
  }
}

vm = {

  vm1 = {
    nic_name            = "todo_nic_frontend"
    nic_location        = "central India"
    resource_group_name = "todo_rg"
    subnet_name         = "frontend_subnet"
    vnet_name           = "todo_vnet"
    vm_name             = "frontendvm"
    vm_location         = "central India"
    vm_size             = "Standard_B1s"
    keyvault_name       = "Vault4444"
    secret_username     = "frontendVM-name"
    secret_password     = "frontendVM-pwd"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-jammy"
    sku                 = "22_04-lts"
    osversion           = "latest"
    public_ip_name      = "frontend_pip"
  }

  vm2 = {

    nic_name            = "todo_nic_backend"
    nic_location        = "central India"
    resource_group_name = "todo_rg"
    subnet_name         = "backend_subnet"
    vnet_name           = "todo_vnet"
    vm_name             = "backendvm"
    vm_location         = "central India"
    vm_size             = "Standard_B1s"
    keyvault_name       = "Vault4444"
    secret_username     = "backendVM-name"
    secret_password     = "backendVM-pwd"
    publisher           = "Canonical"
    offer               = "0001-com-ubuntu-server-jammy"
    sku                 = "22_04-lts"
    osversion           = "latest"
    public_ip_name      = "backend_pip"

  }
}



