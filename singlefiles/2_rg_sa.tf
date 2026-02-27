terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.60.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "aa73ca07-e489-47f8-8d4b-6879e95ac79b"
}

# Variable
Variable 'prefix'{
  default = "tfstate"
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = "Central India"
}

### Create a storage account
resource "azurerm_storage_account" "sa" {
  name                     = "${var.prefix}demosafeb26"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

### Create a storage account container
resource "azurerm_storage_container" "sa-container" {
  name                  = "${var.prefix}container"
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}