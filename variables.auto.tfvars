resource_group_name              = "Primary"
storage_account_replication_type = "GRS"

vnet_name                   = "Bastion"
vnet_address_space          = ["10.0.0.0/16"]
subnet_address_prefixes     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
network_security_group_name = "Bastion-Defence-System"