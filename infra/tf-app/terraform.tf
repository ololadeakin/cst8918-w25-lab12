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

resource "azurerm_virtual_network" "app_vnet" {
  name                = "app-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name

  tags = {
    environment = "production"
    project     = "cst8918-lab12"
  }
}

resource "azurerm_subnet" "app_subnet" {
  name                 = "app-subnet"
  resource_group_name  = azurerm_resource_group.app_rg.name
  virtual_network_name = azurerm_virtual_network.app_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_virtual_network" "app_vnet_secondary" {
  name                = "app-vnet-secondary"
  address_space       = ["10.2.0.0/16"]
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name

  tags = {
    environment = "production"
    project     = "cst8918-lab12"
    role        = "secondary-network"
  }
}

resource "azurerm_subnet" "app_subnet_secondary_vnet" {
  name                 = "app-subnet-secondary"
  resource_group_name  = azurerm_resource_group.app_rg.name
  virtual_network_name = azurerm_virtual_network.app_vnet_secondary.name
  address_prefixes     = ["10.2.1.0/24"]
}

provider "azurerm" {
  features {}
  use_oidc = true
}