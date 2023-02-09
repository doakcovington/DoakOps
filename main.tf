# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "doakops-rg" {
  name     = "DoakOps-resourceGroup"
  location = "westus2"
  tags = {
    environment = "dev"
  }
}

resource "azurerm_static_site" "doakops-site" {
  name                = "DoakOps-site"
  resource_group_name = azurerm_resource_group.doakops-rg.name
  location            = azurerm_resource_group.doakops-rg.location

  tags = {
    environment = "dev"
  }
}

resource "azurerm_key_vault" "example" {
  name                        = "doakops-site-keyvault"
  location                    = azurerm_resource_group.doakops-rg.location
  resource_group_name         = azurerm_resource_group.doakops-rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "Create",
      "List",
      "Delete",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Delete"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}


