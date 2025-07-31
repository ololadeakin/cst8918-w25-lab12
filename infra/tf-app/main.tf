resource "azurerm_resource_group" "app_rg" {
  name     = "akin0098-a12-rg"
  location = "Canada Central"
}

resource "azurerm_public_ip" "app_ip" {
  name                = "app-public-ip"
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name

  allocation_method   = "Static"
  sku                 = "Standard"
}