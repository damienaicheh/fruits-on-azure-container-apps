resource "azurerm_role_assignment" "users_grafana_viewer" {
  for_each             = toset(local.users_identities)
  scope                = azurerm_resource_group.this.id
  role_definition_name = "Grafana Viewer"
  principal_id         = each.key
}

resource "azurerm_role_assignment" "users_grafana_editor" {
  for_each             = toset(local.users_identities)
  scope                = azurerm_resource_group.this.id
  role_definition_name = "Grafana Editor"
  principal_id         = each.key
}

resource "azurerm_role_assignment" "users_monitor_reader" {
  for_each             = toset(local.users_identities)
  scope                = azurerm_resource_group.this.id
  role_definition_name = "Monitoring Reader"
  principal_id         = each.key
}

resource "azurerm_role_assignment" "grafana_viewer" {
  scope                = azurerm_resource_group.this.id
  role_definition_name = "Grafana Viewer"
  principal_id         =  azurerm_dashboard_grafana.this.identity[0].principal_id
}

resource "azurerm_role_assignment" "grafana_editor" {
  scope                = azurerm_resource_group.this.id
  role_definition_name = "Grafana Editor"
  principal_id         =  azurerm_dashboard_grafana.this.identity[0].principal_id
}

resource "azurerm_role_assignment" "monitor_reader" {
  scope                = azurerm_resource_group.this.id
  role_definition_name = "Monitoring Reader"
  principal_id         =  azurerm_dashboard_grafana.this.identity[0].principal_id
}