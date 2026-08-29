locals {
  common_tags = {
    env = var.env
    owner = var.owner
  }
  
  name_prefix = "${var.BU}-${var.env}"
  rg_name = "rg-${local.name_prefix}"

}