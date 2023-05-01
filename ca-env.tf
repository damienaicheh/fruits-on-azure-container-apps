resource "azurerm_container_app_environment" "this" {
  name                       = format("cae-%s", local.resource_suffix_kebabcase)
  location                   = azurerm_resource_group.this.location
  resource_group_name        = azurerm_resource_group.this.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
}