locals {
  name_suffix_safe  = lower(join("-", var.name_suffix == "" ? [] : [var.name_suffix]))
  resource_group_name = "${var.names.resource_group_type}-${var.names.product_name}-${var.names.environment}-${var.names.location}${local.name_suffix_safe}"
  unique_name         = var.unique_name == "true" ? random_integer.suffix[0].result : (var.unique_name == "false" ? null : var.unique_name)
}