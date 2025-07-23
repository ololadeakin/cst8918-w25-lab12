terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "akin0098-githubactions-rg"
    storage_account_name = "akin0098githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "app_rg" {
  name     = "akin0098-a12-rg"
  location = "Canada Central"
}
