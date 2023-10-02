######################
### Storage module ###
######################

#storage_account_name = "" 
#storage_account_tier = "" 
#storage_account_replication_type = "" 
#storage_container_name = "" 
#storage_container_access_type = "" 

#######################
### Keyvault module ###
#######################

#keyvault_name = "" 
#keyvault_access_policy = ""

######################
### Network module ###
######################

virtual_network_name = "Bastion"
virtual_network_address_space = ["10.0.0.0/16"]
subnet_address_prefixes = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
network_security_group_name = "Bastion-Defence-System"

#################
### VM module ###
#################
#vm_name = ""
#vm_size = ""