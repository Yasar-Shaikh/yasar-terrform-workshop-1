output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}


output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

#add vet name and snet name

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}


