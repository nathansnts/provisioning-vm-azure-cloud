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

output "name_vnet" {
  description = "Nome da Virtual Network"
  value       = module.network.name_vnet
}

output "name_subnet" {
  description = "Nome da Subnet"
  value       = module.network.name_subnet
}

output "vm_details" {
  description = "Detalhes de todas as VMs"
  value = {
    for k, v in module.vm : k => {
      name       = v.vm_name
      nic_id     = v.nic_id
      private_ip = v.ip_vm
      public_ip  = v.public_ip
    }
  }
}