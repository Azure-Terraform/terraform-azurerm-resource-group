locals {
  resource_group_name = "${var.names.resource_group_type}-${var.names.product_name}-${var.names.environment}-${var.names.location}"

  unique_name = var.unique_name == "true" ? random_integer.suffix[0].result : (var.unique_name == "false" ? null : var.unique_name)
}

resource "random_integer" "suffix" {
  count = var.unique_name == "true" ? 1 : 0

  min = 10000
  max = 99999
}

resource "azurerm_resource_group" "rg" {
  name     = local.unique_name != null ? "${local.resource_group_name}-${local.unique_name}" : local.resource_group_name
  location = var.location
  tags     = var.tags
}
