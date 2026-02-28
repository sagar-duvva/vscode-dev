output "rg_name" {
  value = azurerm_resource_group.rg.name
}
output "rg_location" {
  value = azurerm_resource_group.rg.location
}
output "sa_name" {
  value = azurerm_storage_account.sa.name
}
output "sa_container_name" {
  value = azurerm_storage_container.sa-container.name
}