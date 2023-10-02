variable "resource_group_name" {
  description = "Name of the resource group the storage account should be placed in"
  type        = string
}

variable "resource_group_location" {
  description = "Resource group location - to ensure storage resources are placed in the same location"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account. If none are provided, a name will be generated randomly."
  type = string
  default = ""
}

variable "storage_container_name" {
  description = "Name of the storage account. If none are provided, a name will be generated randomly."
  type = string
  default = ""
}

variable "storage_account_tier" {
  type    = string
  default = "Standard"
}

variable "storage_account_replication_type" {
  type    = string
  default = "GRS"
}

variable "storage_container_access_type" {
  type    = string
  default = "private"
}