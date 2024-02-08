terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }

  backend "azurerm" {
    resource_group_name  = "GAGGIRG2"
    storage_account_name = "gaggist2"
    container_name       = "devcontainer"
    key                  = "dynamicblock.tfstate"

  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}