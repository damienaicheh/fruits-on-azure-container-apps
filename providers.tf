provider "azurerm" {
  features {
    log_analytics_workspace {
      permanently_delete_on_destroy = true
    }
  }
  skip_provider_registration = false
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.51.0"
    }
  }
  required_version = ">=1.4.5"

  backend "azurerm" {}
}
