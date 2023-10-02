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
    type = string
    default = "Standard_F2"
}

variable "vm_name_prefix" {
    type = string
    default = "vm"
}

variable "vm_username" {
    type = string
    default = "admin"
}

variable "vm_secret" {
    type = string
    sensitive = true
}