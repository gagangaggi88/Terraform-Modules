terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "GAGGIRG2"
    storage_account_name = "gaggist2"
    container_name       = "gaggicontainer2"
    key                  = "WVM/wvm.terraform.tfstate"
  }


}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}