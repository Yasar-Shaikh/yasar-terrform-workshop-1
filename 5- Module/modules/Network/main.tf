resource "azurerm_virtual_network" "vnet" {
  name                = :${var.env}-${var.project}-vnet
  address_space       = [var.vnet_address_space]
  location            = var.location
  resource_group_name = var.resource_group_name
tags = {
    environment = var.env
    module     = "network"
  }

  resource "azurerm_subnet" "subnet" {
    name                = "${var.env}-${var.project}-snet"
    resource_group_name = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes     = [var.subnet_prefix[count.index]]
  }
}


