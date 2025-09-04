terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.42.0"
    }
  }
}

provider "azurerm" {
  features {}

}

terraform {
  backend "azurerm" {
    resource_group_name  = "practiceTerraform"
    storage_account_name = "machakishan"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

data "azurerm_resource_group" "rg1" {
  name = "practiceTerraform"
}

output "resource_group_name" {
  value = data.azurerm_resource_group.rg1.name
}


resource "azurerm_resource_group" "RG2" {
  name     = "testTerraform"
  location = "West Europe"
  tags = {
    environment = "dev"
  }
}


resource "azurerm_virtual_network" "vnet1" {
name                 = "testvnet"
location             = azurerm_resource_group.RG2.location
resource_group_name  = azurerm_resource_group.RG2.name
address_space        = ["10.0.0.0/16"]
dns_servers          = ["10.0.0.4","10.0.0.5"]

subnet {
      name = "subnet1"
      address_prefixes = ["10.0.1.0/24"]
}
subnet {
      name = "subnet2"
      address_prefixes = ["10.0.2.0/24"]
}


}


