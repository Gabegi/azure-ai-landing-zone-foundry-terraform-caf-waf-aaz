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

output "ai_workloads_vnet_id" {
  description = "Resource ID of the AI workloads virtual network."
  value       = azurerm_virtual_network.ai_workloads.id
}

output "ai_workloads_vnet_name" {
  description = "Name of the AI workloads virtual network."
  value       = azurerm_virtual_network.ai_workloads.name
}

output "ai_workloads_vnet_resource_group" {
  description = "Resource group containing the AI workloads virtual network."
  value       = azurerm_resource_group.connectivity.name
}
