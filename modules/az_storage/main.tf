provider "azurerm" {
  features {}
}

resource "random_pet" "sa_name" {
  length    = 2
  separator = ""
}

resource "random_pet" "sc_name" {
  length = 2
  prefix = "sc"
}

resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name != "" ? var.storage_account_name : "${random_pet.sa_name.id}"
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_storage_container" "sc" {
  name                  = var.storage_container_name != "" ? var.storage_container_name : "${random_pet.sc_name.id}"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = var.storage_container_access_type
}