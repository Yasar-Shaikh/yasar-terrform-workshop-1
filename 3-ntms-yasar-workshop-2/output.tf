output "rg_name" {
 value =  azurerm_resource_group.rg.name
}

output "rg_id" {
  value =  azurerm_resource_group.rg.id
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_name" {
  value = azurerm_subnet.snet.name
}

output "nsg_name" {
  value = azurerm_network_security_group.nsg.name
}


