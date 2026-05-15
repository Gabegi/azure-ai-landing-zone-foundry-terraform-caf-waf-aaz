resource "azurerm_resource_group" "connectivity" {
  name     = "rg-platform-connectivity"
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "ai_platform" {
  name                = "vnet-ai-platform"
  location            = azurerm_resource_group.connectivity.location
  resource_group_name = azurerm_resource_group.connectivity.name
  address_space       = [var.ai_platform_address_space]
  tags                = var.tags
}

resource "azurerm_virtual_network" "ai_foundry_workload" {
  name                = "vnet-ai-foundry-workload"
  location            = azurerm_resource_group.connectivity.location
  resource_group_name = azurerm_resource_group.connectivity.name
  address_space       = [var.ai_foundry_workload_address_space]
  tags                = var.tags
}
