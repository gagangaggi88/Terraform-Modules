terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "GAGGIRG1"
    storage_account_name = "gaggist"
    container_name       = "gaggicontainer"
    key                  = "AKS/gaggiaks.tfstate"

  }

}

provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}
