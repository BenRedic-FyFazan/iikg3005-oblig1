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
  sensitive = true
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
  value = module.az_network.vnet.address_space[0]
}

output "subnets" {
  description = "Map of subnet names to their corresponding subnet_prefix"
  value = {
    for i, subnet in module.az_network.subnet : subnet.name => element(var.subnet_address_prefixes, i)
  }
}

output "network_security_group" {
  value = module.az_network.nsg.name
}

output "vm" {
  value = {
    name = module.az_vm.vm.name
    pip = module.az_vm.public_ip.ip_address
  }
}

output "vm_credentials" {
  value = {
    admin_username = module.az_vm.admin_username.value
    admin_password = module.az_vm.admin_secret.value

  }
  sensitive = true
}