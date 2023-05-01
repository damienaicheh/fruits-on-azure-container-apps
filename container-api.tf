resource "azurerm_container_app" "api" {
  name                         = format("ca-api-%s", local.resource_suffix_kebabcase)
  container_app_environment_id = azurerm_container_app_environment.this.id
  resource_group_name          = azurerm_resource_group.this.name
  revision_mode                = "Single"

  lifecycle {
    ignore_changes = [
      template.0.container[0].image
    ]
  }

  secret {
    name  = "container-registry-password"
    value = azurerm_container_registry.this.admin_password
  }

  secret {
    name  = "mongodb-connection-string"
    value = azurerm_cosmosdb_account.this.connection_strings[0]
  }

  registry {
    server               = azurerm_container_registry.this.login_server
    username             = azurerm_container_registry.this.admin_username
    password_secret_name = "container-registry-password"
  }

  ingress {
    external_enabled = true
    target_port      = 3000
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    container {
      name   = format("ca-api")
      image  = "crdevwefrt01.azurecr.io/fruits-backend:1.0.0"
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name        = "MONGODB_URI"
        secret_name = "mongodb-connection-string"
      }
    }

    min_replicas = 0
  }
}