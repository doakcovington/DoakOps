resource "azurerm_resource_group" "doakops" {
  name     = "RG-DOAKOPS-${var.env}"
  location = "westus2"
}




