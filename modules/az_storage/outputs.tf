output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.sa.name
}

output "storage_container_name" {
  description = "The name of the storage container."
  value       = azurerm_storage_container.sc.name
}

output "storage_account_primary_access_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.sa.primary_access_key
  sensitive   = true
}

output "storage_account_connection_string" {
  description = "The connection string for the storage account."
  value       = azurerm_storage_account.sa.primary_connection_string
  sensitive   = true
}

output "storage_container_url" {
  description = "The URL of the storage container."
  value       = azurerm_storage_container.sc.id
}
