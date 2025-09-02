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

  client_id       = "f3f37179-dee0-4d14-881e-6e99751131e4"
  client_secret   = "U3n8Q~pa4HKQci8gm0zT3t1M4aXccqZKMjuLtbgM"
  tenant_id       = "e7e3e685-1fdd-4417-b3ea-0b9be7e97e91"
  subscription_id = "1831ccc2-0647-44b3-b886-8bb8906d9fdf"
}

resource "azurerm_resource_group" "RG1" {
  name     = "terraformPractice"
  location = "EAST US"
}
