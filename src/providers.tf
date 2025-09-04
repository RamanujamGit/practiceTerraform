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
