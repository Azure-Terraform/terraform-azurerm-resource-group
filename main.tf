locals {
  resource_group_name = "${var.names.resource_group_type}-${var.names.product_name}-${var.names.environment}-${var.names.location}"
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location
  tags     = var.tags
}