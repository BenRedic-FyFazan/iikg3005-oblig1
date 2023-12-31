terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.73.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.az_credentials.subscription_id
  client_id       = var.az_credentials.client_id
  client_secret   = var.az_credentials.client_secret
  tenant_id       = var.az_credentials.tenant_id
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${local.location}-${local.client_name}"
  location = local.location
}

module "az_storage" {
  source                           = "./modules/az_storage"
  resource_group_name              = azurerm_resource_group.rg.name
  resource_group_location          = azurerm_resource_group.rg.location
  storage_account_replication_type = var.storage_account_replication_type
}

module "az_keyvault" {
  source                             = "./modules/az_keyvault"
  resource_group_location            = azurerm_resource_group.rg.location
  resource_group_name                = azurerm_resource_group.rg.name
  storage_account_name               = module.az_storage.storage_account.name
  storage_account_primary_access_key = module.az_storage.storage_account.primary_access_key
}

module "az_network" {
  source                        = "./modules/az_network"
  virtual_network_name          = var.virtual_network_name
  virtual_network_address_space = var.virtual_network_address_space
  resource_group_name           = azurerm_resource_group.rg.name
  resource_group_location       = azurerm_resource_group.rg.location
  subnet_address_prefixes       = var.subnet_address_prefixes
  network_security_group_name   = var.network_security_group_name
}

module "az_vm" {
  source                  = "./modules/az_vm"
  resource_group_name     = azurerm_resource_group.rg.name
  resource_group_location = azurerm_resource_group.rg.location
  subnet_id               = module.az_network.subnet[0].id
  vm_username             = var.vm_username
  vm_secret               = var.vm_secret
  keyvault_id             = module.az_keyvault.key_vault.id
}