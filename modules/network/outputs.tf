output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "name_subnet" {
  value = azurerm_subnet.subnet.name
}

output "name_vnet" {
  value = azurerm_virtual_network.vnet.name
}
