output "id" {
  description = "Resource group id"
  value       = azurerm_resource_group.rg.id
}

output "location" {
  description = "Resource group location"
  value = azurerm_resource_group.rg.location
}

output "name" {
  description = "Resource group name"
  value = azurerm_resource_group.rg.name
}

output "rg" {
  description = "Resource group resource"
  value       = azurerm_resource_group.rg
}
