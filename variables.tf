variable "az_credentials" {
    description = "Container for Azure-credentials"
    type = object({
        tenant_id = string
        client_id = string
        client_secret = string
        subscription_id = string
    })
}

variable "resource_group_name" {
    type = string
}

variable "storage_account_replication_type" {
    type = string
}

variable "vnet_name" {
    type = string
}

variable "vnet_address_space" {
    type = list(string)
}

variable "subnet_address_prefixes" {
    type = list(string)
}

variable "network_security_group_name" {
    type = string
}

variable "vm_username" {
    type = string
}

variable "vm_secret" {
    type = string
}