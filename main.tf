locals {
  resource_group_name = "${var.names.resource_group_type}-${var.names.product_name}-${var.names.environment}-${var.names.location}"
}

resource "random_integer" "suffix" {
  count = var.unique_name ? 1 : 0

  min = 10000
  max = 99999
}

resource "azurerm_resource_group" "rg" {
  name     = var.unique_name ? "${local.resource_group_name}-${random_integer.suffix[0].result}" : local.resource_group_name
  location = var.location
  tags     = var.tags
}