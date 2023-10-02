provider "azurerm" {
    features {}
}

resource "random_pet" "vm_name" {
    length = 1
    prefix = var.vm_name_prefix
}

resource "azurerm_public_ip" "pip" {
    name                = "${random_pet.vm_name.id}-pip"
    resource_group_name = var.resource_group_name
    location            = var.resource_group_location
    allocation_method   = "Static"
}

resource "azurerm_network_interface" "vm_nic" {
    name                = "${random_pet.vm_name.id}-nic"
    location            = var.resource_group_location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = var.subnet_id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.pip.id
    }
}


resource "azurerm_windows_virtual_machine" "vm" {
    name                            = "${random_pet.vm_name.id}"
    resource_group_name             = var.resource_group_name
    location                        = var.resource_group_location
    size                            = var.vm_size
    admin_username                  = var.vm_username
    admin_password                  = var.vm_secret
    network_interface_ids           = [azurerm_network_interface.vm_nic.id]

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