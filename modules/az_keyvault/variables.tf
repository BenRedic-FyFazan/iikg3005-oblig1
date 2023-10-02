variable "resource_group_location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "keyvault_name" {
  description = "Name of the keyvault to be made. If no name is provided, one will be created randomly"
  type = string
  default = ""
}

variable "storage_account_primary_access_key" {
  type      = string
  sensitive = true
}

variable "keyvault_access_policy" {
  description = "Access policies for the keyvault"
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