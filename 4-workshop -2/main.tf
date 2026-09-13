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
  for_each = {
    web = "10.1.0.0/24"
    app = "10.1.2.0/24"
    db  = "10.1.3.0/24"
  }
  name                 = "${each.key}-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "yasar-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    env   = "dev"
    owner = "yasar"
  }
  depends_on = [ azurerm_virtual_network.vnet ]
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

resource "azurerm_network_interface" "nic" {
  count = 2
  name                = "yasar-nic-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet["web"].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_subnet_network_security_group_association" "snet_nsg_assoc" {
  for_each = azurerm_subnet.snet
  subnet_id                 = azurerm_subnet.snet["web"].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
