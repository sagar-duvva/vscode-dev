# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix_sa_backend}-rg"
  location = var.location
}