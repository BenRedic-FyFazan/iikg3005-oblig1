variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vm_size" {
  description = "Size of the Virtual Machine - Must be an azure-VM size. Defaults to 'Standard_F2'"
  type    = string
  default = "Standard_F2"
}

variable "vm_name" {
  description = "Name of the virtual machine. If not provided, a random name will be generated"
  type        = string
  default     = ""
}

variable "vm_username" {
  description = "Username for the VM administrator"
  type = string
}

variable "vm_secret" {
  description = "Password for the VM administrator"
  type = string
}

variable "keyvault_id" {
  description = "The keyvault to store the VM secrets in"
  type = string
}