output "key_vault_name" {
  description = "The name of the Azure Key Vault."
  value       = azurerm_key_vault.kv.name
}

output "key_vault_id" {
  description = "The ID of the Azure Key Vault."
  value       = azurerm_key_vault.kv.id
}

output "key_vault_uri" {
  description = "The URI of the Azure Key Vault."
  value       = azurerm_key_vault.kv.vault_uri
}

output "secret_id" {
  description = "The ID of the secret stored in the Azure Key Vault."
  value       = azurerm_key_vault_secret.sa_accesskey.id
}
