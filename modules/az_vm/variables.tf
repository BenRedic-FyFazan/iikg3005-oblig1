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
  type    = string
  default = "Standard_F2"
}

variable "vm_name" {
  description = "Name of the virtual machine. If not provided, a random name will be generated"
  type    = string
  default = ""
}

variable "vm_username" {
  type    = string
}

variable "vm_secret" {
  type      = string
  sensitive = true
}