# Azure - Resource Group Module

## Introduction

This module will create a new Resource Group in Azure.

Naming for this resource is as follows, based on published RBA naming convention (https://github.com/openrba/python-azure-naming).

    <rba.resourceGroupType>-<rba.productName>-<rba.environment>-<rba.azureRegion>-<var.name_suffix (optional)>

<!--- BEGIN_TF_DOCS --->
## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.0.0 |
| random | >= 2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| location | Azure Region | `string` | n/a | yes |
| names | Names to be applied to resources (inclusive) | <pre>object({<br>    environment         = string<br>    location            = string<br>    market              = string<br>    product_name        = string<br>    resource_group_type = string<br>  })</pre> | n/a | yes |
| tags | Tags to be applied to resources (inclusive) | `map(string)` | n/a | yes |
| unique\_name | Freeform input to append to resource group name. Set to 'true', to append 5 random integers | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| id | Resource group id |
| location | Resource group location |
| name | Resource group name |
| rg | Resource group resource |
<!--- END_TF_DOCS --->
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 2.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [random_integer.suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure Region | `string` | n/a | yes |
| <a name="input_name_suffix"></a> [name\_suffix](#input\_name\_suffix) | name suffix e.g rg, blue etc | `string` | `""` | no |
| <a name="input_names"></a> [names](#input\_names) | Names to be applied to resources (inclusive) | <pre>object({<br/>    environment         = string<br/>    location            = string<br/>    market              = string<br/>    product_name        = string<br/>    resource_group_type = string<br/>  })</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to resources (inclusive) | `map(string)` | n/a | yes |
| <a name="input_unique_name"></a> [unique\_name](#input\_unique\_name) | Freeform input to append to resource group name. Set to 'true', to append 5 random integers | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Resource group id |
| <a name="output_location"></a> [location](#output\_location) | Resource group location |
| <a name="output_name"></a> [name](#output\_name) | Resource group name |
| <a name="output_rg"></a> [rg](#output\_rg) | Resource group resource |
<!-- END_TF_DOCS -->