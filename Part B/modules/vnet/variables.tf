variable "vnet_name" {
  type        = string
  description = "Name of the VNet"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for VNet"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
}

variable "subnet_prefixes" {
  type        = list(string)
  description = "Address prefixes for subnet"
}
