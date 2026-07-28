resource "azurerm_resource_group" "rg-xyz" {
    for_each = var.rgs
    name = each.value.rg_name 
    location = each.value.location
}

variable "rgs" {}

