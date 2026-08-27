locals {
  prefix = "${var.org_name}-${var.env}"

  rg_name = "${local.prefix}-rg"

  common_tags = {
    env   = var.env
    org   = var.org_name
    owner = "yasar"
  }
}

