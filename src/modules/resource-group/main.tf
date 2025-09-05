

data "azurerm_resource_group" "rg1" {
  name = "practiceTerraform"
}

output "resource_group_name" {
  value = data.azurerm_resource_group.rg1.name
}


resource "azurerm_resource_group" "RG2" {
  name     = var.rg_name
  location = var.location
  tags = {
    environment = "dev"
  }
}





