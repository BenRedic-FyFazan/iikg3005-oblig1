output "rg_name" {
  value = azurerm_resource_group.rg.name
}

output "rg_location" {
  value = azurerm_resource_group.rg.location
}

output "sa_name" {
    value = module.az_storage.storage_account.name
}

output "sa_primary_access_key" {
  value = module.az_keyvault.storage_account_access_key
}

output "sc_name" {
    value = module.az_storage.storage_container.name
}

output "kv_name" {
    value = module.az_keyvault.key_vault.name
}

output "vnet_name" {
  value = module.az_network.vnet.name
}

output "vnet_address_space" {
  value = module.az_network.vnet.address_space
}

output "subnets" {
    description = "Map of subnet names to their corresponding details"
    value = {
    for i, subnet in module.module.az_network.subnet : 
    subnet.name => {
      subnet_name = subnet.name,
      address_prefix = element(var.subnet_address_prefixes, i)
    }
  }
}

output "network_security_group" {
  value = module.az_network.nsg.name
}

output "vm_username" {
  value = module.az_vm.kv_username
  sensitive = true
}

output "vm_secret" {
  value = module.az_vm.kv_secret
  sensitive = true
}