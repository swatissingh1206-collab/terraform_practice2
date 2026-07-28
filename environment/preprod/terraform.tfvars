rgs = {
  rg01 = {
    rg_name  = "rg-dev"
    location = "centralindia"
  }
}

vnets = {
  vnet01 = {
    vnet_name     = "vnet-dev"
    rg_name       = "rg-dev"
    location      = "centralindia"
    address_space = ["10.125.0.0/16"]
  }

}

snets = {
  snet01 = {
    snet_name        = "frontend-snet-dev"
    rg_name          = "rg-dev"
    vnet_name        = "vnet-dev"
    address_prefixes = ["10.125.1.0/24"]
  }
  snet02 = {
    snet_name        = "backend-snet-dev"
    rg_name          = "rg-dev"
    vnet_name        = "vnet-dev"
    address_prefixes = ["10.125.2.0/24"]
  }
}

pips = {
  pip01 = {
    pip_name          = "frontend_pip"
    rg_name           = "rg-dev"
    location          = "centralindia"
    allocation_method = "Static"
  }
  pip02 = {
    pip_name          = "backend_pip"
    rg_name           = "rg-dev"
    location          = "centralindia"
    allocation_method = "Static"
  }
}

vms = {
  vm01 = {
    vm_name           = "frontend_vm"
    location          = "centralindia"
    rg_name           = "rg-dev"
    vm_size           = "Standard_D2s_v3"
    publisher         = "Canonical"
    offer             = "0001-com-ubuntu-server-jammy"
    sku               = "22_04-lts"
    vm_version        = "latest"
    disk_name         = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    cp_name           = "hostname"
    admin_username    = "azureadmin"
    admin_password    = "Password1234!"
    nic_name          = "frontend-nic"
    nic_ip_name = "frontend_nic_pip"
    snet_name         = "frontend-snet-dev"
    pip_name          = "frontend_pip"
    vnet_name         = "vnet-dev"
  }
  vm02 = {
    vm_name           = "backend_vm"
    location          = "centralindia"
    rg_name           = "rg-dev"
    vm_size           = "Standard_D2s_v3"
    publisher         = "Canonical"
    offer             = "0001-com-ubuntu-server-jammy"
    sku               = "22_04-lts"
    vm_version        = "latest"
    disk_name         = "myosdisk2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    cp_name           = "hostname"
    admin_username    = "azureadmin"
    admin_password    = "Password1234!"
    nic_name          = "backend-nic"
    nic_ip_name = "backend_nic_pip"
    snet_name         = "backend-snet-dev"
    pip_name          = "backend_pip"
    vnet_name         = "vnet-dev"
  }
}
