provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

data "azurerm_client_config" "current" {}

resource "random_pet" "kv_name" {
  length = 2
  prefix = "kv"
}

resource "azurerm_key_vault" "kv" {
  name                        = var.keyvault_name != "" ? var.keyvault_name : "${random_pet.kv_name.id}"
  location                    = var.resource_group_location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions     = var.keyvault_access_policy.key_permissions
    secret_permissions  = var.keyvault_access_policy.secret_permissions
    storage_permissions = var.keyvault_access_policy.storage_permissions
  }
}

resource "azurerm_key_vault_secret" "sa_accesskey" {
  name         = "${var.storage_account_name}-accesskey"
  value        = var.storage_account_primary_access_key
  key_vault_id = azurerm_key_vault.kv.id
}