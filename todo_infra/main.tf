module "ResourceGroup" {

  source = "../Modules/azurerm_resource_group"
  rg     = var.todo_rg

}

module "virtual_network" {

  depends_on      = [module.ResourceGroup]
  source          = "../Modules/azurerm_virtual_network"
  virtual_network = var.vnet

}

module "subnet" {

  depends_on = [module.virtual_network]
  source     = "../Modules/azurerm_subnet"
  subnets = var.subnet

}

module "public_ip" {

  source    = "../Modules/azurerm_public_ip"
  public_ip = var.pip

}

module "sql_server" {

  depends_on = [module.ResourceGroup, module.virtual_network]
  source     = "../Modules/azurerm_SQL_server"
  sql_server = var.server

}

module "sql_database" {

  depends_on = [module.sql_server]
  source     = "../Modules/azurerm_sql_database"
  database = var.database

}

module "virtual_machine" {

  depends_on = [module.subnet, module.public_ip]
  source     = "../Modules/azurerm_virtual_machine"

  virtual_machine = var.vm

}
