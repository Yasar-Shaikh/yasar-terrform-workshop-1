resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags = local.common_tags
  }


resource "azurerm_virtual_network" "vnet" {
  name                = local.name_prefix
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space
  tags = local.common_tags
}

resource "azurerm_subnet" "snet" {
  name                 = local.name_prefix
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_network_security_group" "nsg" {
  name                = local.name_prefix
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = local.common_tags
}

resource "azurerm_network_security_rule" "http" {
  name                        = local.nsg_rules.http.name
  priority                    = local.nsg_rules.http.priority
  direction                   = local.nsg_rules.http.direction
  access                      = local.nsg_rules.http.access
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "rdp" {
  name                        = local.nsg_rules.rdp.name
  priority                    = local.nsg_rules.rdp.priority
  direction                   = local.nsg_rules.rdp.direction
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}
#
#


