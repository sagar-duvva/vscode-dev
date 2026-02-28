### Create a storage account
resource "azurerm_storage_account" "sa" {
  name                     = "${var.prefix_sa_backend}demosafeb26"
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
  name                  = "${var.prefix_sa_backend}container"
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}