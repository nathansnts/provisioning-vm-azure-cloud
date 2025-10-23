module "resource_group" {
  source              = "./modules/resource_groups"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnet_name         = var.subnet_name
  subnet_prefix       = var.subnet_prefix
  allowed_ip          = var.allowed_ip
}

module "vm" {
  source   = "./modules/vm"
  for_each = var.virtual_machines

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  subnet_id           = module.network.subnet_id
  vm_name             = each.value.name
  vm_size             = each.value.size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  os_disk_size_gb     = var.os_disk_size_gb
  image_publisher     = var.image_publisher
  image_offer         = var.image_offer
  image_sku           = var.image_sku
  image_version       = var.image_version
}
