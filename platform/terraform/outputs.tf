output "ai_platform_vnet_id" {
  description = "Resource ID of the AI platform virtual network."
  value       = azurerm_virtual_network.ai_platform.id
}

output "ai_platform_vnet_name" {
  description = "Name of the AI platform virtual network."
  value       = azurerm_virtual_network.ai_platform.name
}

output "ai_platform_vnet_resource_group" {
  description = "Resource group containing the AI platform virtual network."
  value       = azurerm_resource_group.connectivity.name
}

output "ai_foundry_workload_vnet_id" {
  description = "Resource ID of the AI Foundry workload virtual network."
  value       = azurerm_virtual_network.ai_foundry_workload.id
}

output "ai_foundry_workload_vnet_name" {
  description = "Name of the AI Foundry workload virtual network."
  value       = azurerm_virtual_network.ai_foundry_workload.name
}

output "ai_foundry_workload_vnet_resource_group" {
  description = "Resource group containing the AI Foundry workload virtual network."
  value       = azurerm_resource_group.connectivity.name
}
