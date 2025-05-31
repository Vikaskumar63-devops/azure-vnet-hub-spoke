output "peering_hub_to_spoke_id" {
  value = azurerm_virtual_network_peering.hub_to_spoke.id
}

output "peering_spoke_to_hub_id" {
  value = azurerm_virtual_network_peering.spoke_to_hub.id
}

