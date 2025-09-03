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

resource "azurerm_resource_group" "RG1" {
  name     = "terraformPractice"
  location = "EAST US"
}


resource "azurerm_storage_account" "SA" {
  name                     = "machakishan"
  resource_group_name      = azurerm_resource_group.RG1.name
  location                 = azurerm_resource_group.RG1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Dev"
  }
}
