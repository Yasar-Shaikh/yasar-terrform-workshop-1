resource "azurerm_resource_group" "rg" {
  name     = "yasar-ntmstf-rg"
  location = "West US"
  tags = {
    env   = "dev"
    owner = "yasar"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "yasar-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.1.0.0/16"]
  tags = {
    env   = "dev"
    owner = "yasar"
  }
}

resource "azurerm_subnet" "snet" {
  name                 = "web-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.1.0.0/24"]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "yasar-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    env   = "dev"
    owner = "yasar"
  }
}

resource "azurerm_network_security_rule" "http" {
  name                        = "allow-http"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg.name
}

resource "azurerm_network_security_rule" "rdp" {
  name                        = "rdp-allow"
  priority                    = 400
  direction                   = "Inbound"
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



