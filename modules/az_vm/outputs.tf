output "vmm_nic" {
    value = azurerm_network_interface.vm_nic
}

output "vm" {
  value = azurerm_windows_virtual_machine.vm
}

output "vm_admin_username" {
  value = azurerm_key_vault_secret.kv_username
}

output "vm_admin_secret" {
  value = azurerm_key_vault_secret.kv_secret
}

output "public_ip" {
  value = azurerm_public_ip.pip
}
