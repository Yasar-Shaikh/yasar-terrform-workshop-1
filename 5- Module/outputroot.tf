output "vnet_name" {
  value = module.network.vnet_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "nsg_id" {
  value = module.security.nsg_id
}

output "nsg_name" {
  value = module.security.nsg_name
}

output "vm_name" {
  value = module.compute.vm_names
}

output "vm_id" {
  value = module.compute.vm_id
}

output "private_ips" {
  value = module.compute.private_ips
}

