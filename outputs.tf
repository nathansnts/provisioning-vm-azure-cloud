output "resource_group" {
  description = "Nome do grupo de recursos criado"
  value       = module.resource_group.resource_group_name
}

output "vnet_id" {
  description = "ID da Virtual Network"
  value       = module.network.vnet_id
}

output "subnet_id" {
  description = "ID da Subnet"
  value       = module.network.subnet_id
}

output "vm_name" {
  description = "ID da Virtual Machine"
  value       = module.vm.vm_name
}

output "nic_id" {
  description = "ID da Network Interface da VM"
  value       = module.vm.nic_id
}


output "ip_vm" {
  description = "IP da Virtual Machine"
  value       = module.vm.ip_vm
}

output "name_vnet" {
  description = "Nome da Virtual Network"
  value       = module.network.name_vnet

}

output "name_subtnet" {
  description = "Nome da Subnet"
  value       = module.network.name_subnet
}


