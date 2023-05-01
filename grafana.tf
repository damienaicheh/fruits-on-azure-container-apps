resource "azurerm_dashboard_grafana" "this" {
  name                              = format("amg-%s", local.resource_suffix_kebabcase)
  resource_group_name               = azurerm_resource_group.this.name
  location                          = azurerm_resource_group.this.location
  api_key_enabled                   = false
  deterministic_outbound_ip_enabled = false
  public_network_access_enabled     = true

  identity {
    type = "SystemAssigned"
  }

  tags = local.tags
}