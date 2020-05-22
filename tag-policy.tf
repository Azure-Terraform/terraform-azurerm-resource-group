resource "azurerm_policy_definition" "tags" {
  name         = "policy-definition-inheirt-tags-${local.resource_group_name}"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Inherit Tags from Resource Group"

  policy_rule = <<POLICY_RULE
    {
      "if": {
        "allOf": [
          {
            "field": "[concat('tags[', parameters('tagName'), ']')]",
            "exists": "false"
          },
          {
            "value": "[resourceGroup().tags[parameters('tagName')]]",
            "notEquals": ""
          }
        ]
      },
      "then": {
        "effect": "modify",
        "details": {
          "roleDefinitionIds": [
            "/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
          ],
          "operations": [
            {
              "operation": "add",
              "field": "[concat('tags[', parameters('tagName'), ']')]",
              "value": "[resourceGroup().tags[parameters('tagName')]]"
            }
          ]
        }
      }
  }
POLICY_RULE


  parameters = <<PARAMETERS
    {
      "tagName": {
        "type": "String",
        "metadata": {
          "displayName": "Tag Name",
          "description": "Name of the tag, such as 'environment'"
        }
      }
  }
PARAMETERS

}

resource "azurerm_policy_assignment" "tags" {

  for_each = toset([
    "environment",
    "location",
    "market",
    "project",
    "subscription_id",
    "business_unit", 
    "cost_center",
    "sre_team",
    "resource_group_type",
    "subscription_type",
    "product_group",
    "product_name"])

  name                 = "policy-tags-${each.key}"
  scope                = azurerm_resource_group.rg.id
  policy_definition_id = azurerm_policy_definition.tags.id
  description          = "Policy Assignment to inherit ${each.key} tag from Resource Group"
  display_name         = "Inherit ${each.key} from Resource Group"
  location             = var.location

  identity {
    type = "SystemAssigned"
  }

  parameters = <<PARAMETERS
{
  "tagName": {
    "value": "${each.key}"
  }
}
PARAMETERS

}
