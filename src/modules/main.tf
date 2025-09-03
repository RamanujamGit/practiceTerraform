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
    access_key           = "FMp287u24dPtkMtnxUYBLsWVNnTXzzFl9XRB//KTUze/bTr/W4yv2bqU+m/SFauOPgDUAxCqtX4V+ASt326YzQ=="
    resource_group_name  = "practiceTerraform"
    storage_account_name = "machakishan"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

data "azurerm_management_group" "rg1" {
  name = "practiceTerraform"
}

output "resource_group_name" {
  value = data.azurerm_management_group.rg1.name
}



