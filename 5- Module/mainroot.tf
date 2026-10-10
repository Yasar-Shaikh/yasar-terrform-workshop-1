#RG

resource "azurerm_resource_group" "rg" {
  name     = "${var.env}-${var.project-owner}-rg"
  location = var.location
}


#module 1= network
module "network" {
  source        = "./modules/Network"
  env           = var.env
  location      = var.location
  project-owner = var.project-owner
  rg_name       = azurerm_resource_group.rg.name
  add_space     = ["10.1.0.0/16"]
  subnet_prefix = ["10.1.1.0/24"]
}

#module 2= security
module "security" {
  source        = "./modules/Security"
  env           = var.env
  location      = var.location
  project-owner = var.project-owner
  rg_name       = azurerm_resource_group.rg.name
  subnet_id     = module.network.subnet_id
}

# module 3= compute
module "compute" {
  source         = "./modules/Compute"
  env            = var.env
  location       = var.location
  project-owner  = var.project-owner
  rg_name        = azurerm_resource_group.rg.name
  subnet_id      = module.network.subnet_id
  admin_username = var.admin_username
  admin_password = data.azurerm_key_vault_secret.vm_password.value
  vm_count       = var.vm_count
}



