# Create a resource group
resource "azurerm_resource_group" "rg" {
  count    = var.rgs
  name     = "${var.prefix}-rg-${count.index + 1}"
  location = var.location
}