data "azurerm_client_config" "current" {}
resource "azurerm_resource_group" "doakops-rg" {
  name     = var.resource_group_name
  location = "westus2"
  tags = {
    environment = var.environment
  }
}

resource "azurerm_static_site" "example" {
  name                = var.static_site_name
  resource_group_name = azurerm_resource_group.doakops-rg.name
  location            = azurerm_resource_group.doakops-rg.location
}


