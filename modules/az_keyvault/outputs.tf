output "key_vault" {
  description = "The key_vault resource"
  value       = azurerm_key_vault.kv
}

output "storage_account_access_key" {
  description = "The ID for the access key for the storage account"
  value       = azurerm_key_vault_secret.sa_accesskey.id
}
