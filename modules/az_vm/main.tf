provider "azurerm" {
  features {}
}

resource "random_pet" "vm_name" {
  length = 1
  prefix = "vm"
}

resource "azurerm_public_ip" "pip" {
  name                = var.vm_name != "" ? var.vm_name : "${random_pet.vm_name.id}-pip"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "vm_nic" {
  name                = var.vm_name != "" ? var.vm_name : "${random_pet.vm_name.id}-nic"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                  = var.vm_name != "" ? var.vm_name : "${random_pet.vm_name.id}"
  resource_group_name   = var.resource_group_name
  location              = var.resource_group_location
  size                  = var.vm_size
  admin_username        = var.vm_username
  admin_password        = var.vm_secret
  network_interface_ids = [azurerm_network_interface.vm_nic.id]

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}

resource "azurerm_key_vault_secret" "kv_username" {
  name         = "${azurerm_windows_virtual_machine.vm.name}-username"
  value        = azurerm_windows_virtual_machine.vm.admin_username
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "kv_secret" {
  name         = "${azurerm_windows_virtual_machine.vm.name}-secret"
  value        = azurerm_windows_virtual_machine.vm.admin_password
  key_vault_id = var.keyvault_id
}