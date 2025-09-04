resource "azurerm_resource_group" "RG2" {
  name     = var.name_rg
  location = var.locations
  tags = {
    environment = "dev"
  }
}
