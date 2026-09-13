resource "azurerm_storage_account" "sa" {
 name = "ntms${random_string.rs.result}"
  resource_group_name = azurerm_resource_group.rg-shared.name
  location            = azurerm_resource_group.rg-shared.location
  account_tier        = "Standard"
  account_replication_type = "LRS"
  provider = azurerm.shared
 }

 resource "azurerm_resource_group" "rg-shared" {
   name     = "ntms-shared-yasar-RG"
   location = "West US"
   provider = azurerm.shared
 }

resource "random_string" "rs" {
  length  = 4
  upper   = false
  special = false
  numeric  = false
}

