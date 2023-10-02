variable "virtual_network_name" {
  type = string
}

variable "virtual_network_address_space" {
  description = "List of virtual network address spaces - defaults to 10.0.0.0/16"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "subnet_address_prefixes" {
  description = "List of subnet address prefixes - defaults to 10.0.0.0/24"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "network_security_group_name" {
  description = "Name of the network security group. If no name is provided it defaults to '[name of vnet]-nsg'"
  type        = string
  default     = ""
}

