resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags = local.common_tags
  }


resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space
  tags = local.common_tags
}

resource "azurerm_subnet" "snet" {
  name                 = local.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_network_security_group" "nsg" {
  name                = local.nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = local.common_tags
}

resource "azurerm_network_security_rule" "http" {
  name                        = local.nsg_rules.http.name
  priority                    = local.nsg_rules.http.priority
  direction                   = local.nsg_rules.http.direction
  access                      = local.nsg_rules.http.access
  protocol                    = local.nsg_rules.http.protocol
  source_port_range           = local.nsg_rules.http.source_port_range
  destination_port_range      = local.nsg_rules.http.destination_port_range
  source_address_prefix       = local.nsg_rules.http.source_address_prefix
  destination_address_prefix  = local.nsg_rules.http.destination_address_prefix
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "rdp" {
  name                        = local.nsg_rules.rdp.name
  priority                    = local.nsg_rules.rdp.priority
  direction                   = local.nsg_rules.rdp.direction
  access                      = local.nsg_rules.rdp.access
  protocol                    = local.nsg_rules.rdp.protocol
  source_port_range           = local.nsg_rules.rdp.source_port_range
  destination_port_range      = local.nsg_rules.rdp.destination_port_range
  source_address_prefix       = local.nsg_rules.rdp.source_address_prefix
  destination_address_prefix  = local.nsg_rules.rdp.destination_address_prefix
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}




