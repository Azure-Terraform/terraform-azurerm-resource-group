# Azure - Resource Group Module

## Introduction

This module will create a new Resource Group in Azure.

Naming for this resource is as follows, based on published RBA naming convention (https://github.com/openrba/python-azure-naming).

    <rba.resourceGroupType>-<rba.productName>-<rba.environment>-<rba.azureRegion>

<!--- BEGIN_TF_DOCS --->
## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| location | Azure Region | `string` | n/a | yes |
| names | Names to be applied to resources (inclusive) | <pre>object({<br>                  environment  = string<br>                  location     = string<br>                  market       = string<br>                  product_name = string<br>                })</pre> | n/a | yes |
| tags | Tags to be applied to resources (inclusive) | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | Resource group id |
| location | Resource group location |
| name | Resource group name |
| rg | Resource group resource |
<!--- END_TF_DOCS --->