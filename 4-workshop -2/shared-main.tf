resource "azurerm_storage_account" "sa" {
 name = "ntms${random_string.rs.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  account_tier        = "Standard"
  account_replication_type = "LRS"
 }

resource "random_string" "rs" {
  length  = 4
  upper   = false
  special = false
  numeric  = false
}