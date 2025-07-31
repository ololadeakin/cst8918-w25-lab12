terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "akin0098-githubactions-rg"
    storage_account_name = "akin0098githubactionsss"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc             = true
  }
}

resource "azurerm_virtual_network" "app_vnet_primaryyyy" {
  name                = "app-vnet-primaryyyy"
  address_space       = ["10.4.0.0/16"]
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name

  tags = {
    environment = "production"
    project     = "cst8918-lab12"
    role        = "primary-network"
  }
}

resource "azurerm_subnet" "app_subnet_primaryyyy_vnet" {
  name                 = "app-subnet-primaryyyy"
  resource_group_name  = azurerm_resource_group.app_rg.name
  virtual_network_name = azurerm_virtual_network.app_vnet_primaryyyy.name
  address_prefixes     = ["10.4.1.0/24"]
}

provider "azurerm" {
  features {}
  use_oidc = true
}