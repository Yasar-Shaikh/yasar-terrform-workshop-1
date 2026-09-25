resource "azurerm_storage_account" "sa" {
access_tier = "Hot"
  account_tier = "Standard"
  account_replication_type = "LRS"
  name = "ntms${random_string.rs.result}"
  resource_group_name = azurerm_resource_group.rg-shared.name
  location = azurerm_resource_group.rg-shared.location
  provider = azurerm.shared
}

resource "azurerm_resource_group" "rg-shared" {
  name     = "ntms-shared-yasar-rg"
  location = "West US"
}

resource "random_string" "rs" {
  length  = 8
  special = false
  upper   = false
  }

  