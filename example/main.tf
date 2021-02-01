terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.32.0"
    }
  }
  required_version = ">=0.13.0"
}

provider "azurerm" {
  features {}
}

data "azurerm_subscription" "current" {
}

module "subscription" {
  source = "github.com/Azure-Terraform/terraform-azurerm-subscription-data.git?ref=v1.0.0"
  subscription_id = data.azurerm_subscription.current.subscription_id
}

module "naming" {
  source = "github.com/Azure-Terraform/example-naming-template.git?ref=v1.0.0"
}

module "metadata" {
  source = "github.com/Azure-Terraform/terraform-azurerm-metadata.git?ref=v1.1.0"

  naming_rules = module.naming.yaml

  market              = "us"
  project             = "https://github.com/Azure-Terraform/terraform-azurerm-metadata/tree/master/example"
  location            = "eastus2"
  environment         = "sandbox"
  product_name        = "contosoweb"
  business_unit       = "infra"
  product_group       = "contoso"
  subscription_id     = module.subscription.output.subscription_id
  subscription_type   = "dev"
  resource_group_type = "app"

  additional_tags = {
    "support_email" = "support@contoso.com"
    "owner"         = "Jon Doe"
  }
}

module "resource_group" {
  source = "../"

  location = module.metadata.location
  names    = module.metadata.names
  tags     = module.metadata.tags
}

output "resource_group" {
  value = module.resource_group.rg
}
