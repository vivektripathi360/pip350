terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.37.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "ba3dd1c9-2ade-4648-a13f-65581e2a2874"
}

resource "azurerm_resource_group" "rg" {
  name     = "vivek-rg"
  location = "westus"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "vivekstorageac"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "vivekcontainer"
  storage_account_name  = "vivekstorageac"
  container_access_type = "private"
}