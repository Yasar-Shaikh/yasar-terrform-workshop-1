locals {
  prefix = "${var.org_name}-${var.env}"

  rg_name = "${local.prefix}-rg"
}