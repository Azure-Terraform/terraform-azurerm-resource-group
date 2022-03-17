variable "location" {
  description = "Azure Region"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources (inclusive)"
  type        = map(string)
}

variable "unique_name" {
  description = "Freeform input to append to resource group name. Set to 'true', to append 5 random integers"
  type        = string
  default     = null
}

variable "names" {
  description = "Names to be applied to resources (inclusive)"
  type        = object({
    environment         = string
    location            = string
    market              = string
    product_name        = string
    resource_group_type = string
  })
}
