resource "azurerm_resource_group" "RG2" {
  name     = var.rg_name
  location = var.location
  tags = {
    environment = "dev"
  }
}


output "resource_group_name" {
  value = azurerm_resource_group.RG2.name
}

output "resource_group_location" {
  value = azurerm_resource_group.RG2.location
}
