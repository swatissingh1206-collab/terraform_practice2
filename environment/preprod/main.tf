module "rgM" {
    source = "../../modules/resource_group"
    rgs = var.rgs
}

module "vneM" {
  source = "../../modules/virtual_network"
  vnets = var.vnets
  depends_on = [ module.rgM ]
}

module "snetM" {
    source = "../../modules/subnet"
    snets = var.snets
    depends_on = [ module.vneM , module.rgM]
}

module "pipM" {
  source = "../../modules/public_ip"
  pips = var.pips
  depends_on = [ module.snetM ,module.vneM, module.rgM,  ]
}

module "vmM" {
  source = "../../modules/virtual_machine"
  vms = var.vms
  depends_on = [ module.rgM, module.vneM, module.snetM, module.pipM ]
}