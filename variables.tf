variable "az_credentials" {
  description = "Container for Azure-credentials"
  type = object({
    tenant_id       = string
    client_id       = string
    client_secret   = string
    subscription_id = string
  })
}

######################
### Storage module ###
######################
variable "storage_account_name" {
  description = "Name of the storage account. If none are provided, a name will be generated randomly."
  type        = string
  default     = ""
}

variable "storage_account_tier" {
  type    = string
  default = "Standard"
}

variable "storage_account_replication_type" {
  type = string
  default = "GRS"
}

variable "storage_container_name" {
  description = "Name of the storage account. If none are provided, a name will be generated randomly."
  type        = string
  default     = ""
}

variable "storage_container_access_type" {
  type    = string
  default = "private"
}

#######################
### Keyvault module ###
#######################
variable "keyvault_name" {
  description = "Name of the keyvault to be made. If no name is provided, one will be created randomly"
  type        = string
  default     = ""
}

variable "keyvault_access_policy" {
  description = <<EOT
    Access policies for the keyvault - Optional. Defaults to: 
      key_permissions = ['Get', 'List', 'Create', 'Delete']
      secret_permissions = ['Get', 'Set', 'List', 'Delete', 'Purge']
      storage_permissions = ['Get', 'Set', 'List', 'Delete']
  EOT
  type = object({
    key_permissions     = list(string)
    secret_permissions  = list(string)
    storage_permissions = list(string)
  })

  default = {
    key_permissions = [
      "Get", "List", "Create", "Delete"
    ]

    secret_permissions = [
      "Get", "Set", "List", "Delete", "Purge"
    ]

    storage_permissions = [
      "Get", "Set", "List", "Delete"
    ]
  }
}

######################
### Network module ###
######################
variable "virtual_network_name" {
  type = string
}

variable "virtual_network_address_space" {
  description = "List of virtual network address spaces - defaults to 10.0.0.0/16"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  description = "List of subnet address prefixes - defaults to only one subnet: 10.0.0.0/24"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "network_security_group_name" {
  description = "Name of the network security group. If no name is provided it defaults to '[name of vnet]-nsg'"
  type        = string
  default     = ""
}

#################
### VM module ###
#################
variable "vm_name" {
  description = "Name of the virtual machine. If not provided, a random name will be generated"
  type        = string
  default     = ""
}

variable "vm_size" {
  description = "Size of the Virtual Machine - Must be an azure-VM size. Defaults to 'Standard_F2'"
  type    = string
  default = "Standard_F2"
}

variable "vm_username" {
  description = "Username for the VM administrator"
  type = string
}

variable "vm_secret" {
  description = "Password for the VM administrator"
  type = string
}