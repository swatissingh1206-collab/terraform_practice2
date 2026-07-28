resource "azurerm_virtual_machine" "vm-xyz" {
  for_each              = var.vms
  name                  = each.value.vm_name
  location              = each.value.location
  resource_group_name   = each.value.rg_name
  vm_size               = each.value.vm_size
  network_interface_ids = [azurerm_network_interface.nic-xyz[each.key].id]
  storage_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.vm_version
  }
  storage_os_disk {
    name              = each.value.disk_name
    caching           = each.value.caching
    create_option     = each.value.create_option
    managed_disk_type = each.value.managed_disk_type
  }
  os_profile {
    computer_name  = each.value.cp_name
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

#frontend vm config
resource "azurerm_network_interface" "nic-xyz" {
  for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  ip_configuration {
    name                          = each.value.nic_ip_name
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
data "azurerm_subnet" "subnet" {
  for_each             = var.vms
  name                 = each.value.snet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
}
data "azurerm_public_ip" "pip" {
  for_each            = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

variable "vms" {}

