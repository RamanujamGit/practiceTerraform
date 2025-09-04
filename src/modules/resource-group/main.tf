resource "azurerm_resource_group" "RG2" {
  name     = "testTerraform"
  location = "West Europe"
  tags = {
    environment = "dev"
  }
}
