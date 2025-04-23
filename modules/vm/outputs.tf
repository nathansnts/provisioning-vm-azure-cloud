output "vm_name" {
  description = "Name da Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "nic_id" {
  description = "ID da Network Interface"
  value       = azurerm_network_interface.nic.id
}


output "ip_vm" {
  description = "IP da Virtual Machine"
  value       = azurerm_network_interface.nic.ip_configuration[0].private_ip_address
}


