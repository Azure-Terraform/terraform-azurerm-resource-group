locals {

  standard_name       = "${var.names.resource_group_type}-${var.names.product_name}-${var.names.environment}-${var.names.location}"
  unique_name         = "${local.standard_name}-${random_integer.suffix.result}"
  resource_group_name = var.unique_name ? local.unique_name  : local.standard_name
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

resource "azurerm_resource_group" "rg" {
  name          = local.resource_group_name
  location      = var.location
  tags          = var.tags
}