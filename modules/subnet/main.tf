resource "azurerm_subnet" "rg-xyz" {
    for_each = var.snets
    name = each.value.snet_name 
    resource_group_name = each.value.rg_name
    virtual_network_name = each.value.vnet_name
    address_prefixes = each.value.address_prefixes
}

variable "snets" {}

