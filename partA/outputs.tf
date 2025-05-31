output "linux_vm_private_ip" {
  value = azurerm_network_interface.linux_nic.ip_configuration[0].private_ip_address
}

output "windows_vm_private_ip" {
  value = azurerm_network_interface.windows_nic.ip_configuration[0].private_ip_address
}

output "sql_vm_private_ip" {
  value = azurerm_network_interface.sql_nic.ip_configuration[0].private_ip_address
}
