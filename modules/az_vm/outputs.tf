output "vm_nic" {
    value = azurerm_network_interface.vm_nic
}

output "vm" {
  value = azurerm_windows_virtual_machine.vm
}

output "public_ip" {
  value = azurerm_public_ip.pip
}
