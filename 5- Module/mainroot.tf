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



