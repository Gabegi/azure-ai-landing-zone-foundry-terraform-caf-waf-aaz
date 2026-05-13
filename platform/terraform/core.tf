# Level 1 - Contoso-AI
resource "azurerm_management_group" "root" {
  name                       = "Contoso-AI"
  display_name               = "Contoso-AI"
  parent_management_group_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_root_id}"
}

# Level 2 - children of Contoso-AI
resource "azurerm_management_group" "level2" {
  for_each = {
    platform      = "Platform"
    landing-zones = "Landing-Zones"
  }

  name                       = "contoso-ai-${each.key}"
  display_name               = each.value
  parent_management_group_id = azurerm_management_group.root.id
}

# Level 3 - children of Landing-Zones
resource "azurerm_management_group" "level3_landing_zones" {
  for_each = {
    internal = "Internal"
    online   = "Online"
  }

  name                       = "contoso-ai-${each.key}"
  display_name               = each.value
  parent_management_group_id = azurerm_management_group.level2["landing-zones"].id
}
