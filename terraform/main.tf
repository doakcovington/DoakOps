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

resource "azurerm_dns_zone" "example-public" {
  name                = "dev-doakops.com"
  resource_group_name = azurerm_resource_group.doakops-rg.name
}


