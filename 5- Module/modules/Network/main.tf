resource "azurerm_virtual_network" "vnet" {
  name                = "${var.env}-${var.project-owner}-vnet"
  address_space       = var.add_space
  location            = var.location
  resource_group_name = var.rg_name
  tags = {
    environment = var.env
    module      = "network"
  }
}


resource "azurerm_subnet" "subnet" {
  name                 = "${var.env}-${var.project-owner}-snet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefix
}




