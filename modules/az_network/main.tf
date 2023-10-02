provider "azurerm" {
  features {}
}

resource "random_pet" "subnet_name" {
  count  = length(var.subnet_address_prefixes)
  length = 2
  prefix = "subnet"
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_address_prefixes)
  name                 = random_pet.subnet_name[count.index].id
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefixes[count.index]]
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group_name != "" ? var.network_security_group_name : "${azurerm_virtual_network.vnet.name}-nsg"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "nsg-association" {
  count                     = length(var.subnet_address_prefixes)
  subnet_id                 = azurerm_subnet.subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}