variable "vnet_name" {
    type = string
}

variable "vnet_address_space" {
    type = list(string)
}

variable "resource_group_name" {
    type = string
}

variable "resource_group_location" {
    type = string
}

variable "subnet_address_prefixes" {
    type = list(string)
}

variable "network_security_group_name" {
    type = string
}