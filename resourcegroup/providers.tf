terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
features        {} 
}

provider "azurerm" {
  alias           = "dev"
  subscription_id = var.dev_sub_id
  features        {}  # Add an empty features block
}

provider "azurerm" {
  alias           = "prod"
  subscription_id = var.prod_sub_id
  features        {}  # Add an empty features block
}
