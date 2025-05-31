output "vm_private_ip" {
  value = azurerm_network_interface.this.ip_configuration[0].private_ip_address
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.this.id
}
