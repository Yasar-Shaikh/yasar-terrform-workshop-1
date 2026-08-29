locals {
  common_tags = {
    env = var.env
    owner = var.owner
  }

  name_prefix = "${var.BU}-${var.env}"
  rg_name = "rg-${local.name_prefix}"
    vnet_name = "vnet-${local.name_prefix}"
    subnet_name = "snet-${local.name_prefix}"
    nsg_name = "nsg-${local.name_prefix}"
    


  nsg_rules = {

    http = {
      name                        = "allow-http"
      priority                    = 300
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_range           = "80"
      destination_port_range      = "*"
      source_address_prefix       = "*"
      destination_address_prefix  = "*"
    }


    rdp = {
      name                        = "rdp-allow"
      priority                    = 400
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_range           = "*"
      destination_port_range      = "3389"
      source_address_prefix       = "*"
      destination_address_prefix  = "*"
    }
  }

}