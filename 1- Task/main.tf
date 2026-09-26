resource "azurerm_storage_account" "satask" {
  count = 3
access_tier = "Hot"
  account_tier = "Standard"
  account_replication_type = "LRS"
  name = "ntms${random_string.rs[count.index].result}"
  resource_group_name = azurerm_resource_group.rg-task.name
  location = azurerm_resource_group.rg-task.location
  lifecycle {
    prevent_destroy = True
  }
  
}

resource "azurerm_resource_group" "rg-task" {
  name     = "ntms-task-yasar-rg"
  location = "West US"
  tags = {
    environment = "task"
    owner       = "yasar"
  }
  lifecycle {
    ignore_changes = [ tags ]
  }
}

resource "random_string" "rs" {
  count = 3
  length  = 8
  special = false
  upper   = false
  }

resource "azurerm_network_security_group" "nsg-task" {
  name                = "ntms-task-nsg"
  location            = azurerm_resource_group.rg-task.location
  resource_group_name = azurerm_resource_group.rg-task.name
}

resource "azurerm_network_security_rule" "nsg-rule" {
  for_each = {
    http = {
      priority = 100
      port     = 80
    }
    rdp = {
      priority = 110
      port     = 3389
    }
  }

  name                        = "Allow-${upper(each.key)}"
  priority                    = each.value.priority
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = tostring(each.value.port)
  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.rg-task.name
  network_security_group_name = azurerm_network_security_group.nsg-task.name
}

