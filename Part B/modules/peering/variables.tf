variable "resource_group_name" {
  type        = string
  description = "Resource Group"
}

variable "hub_vnet_name" {
  type        = string
  description = "Hub VNet name"
}

variable "hub_vnet_id" {
  type        = string
  description = "Hub VNet ID"
}

variable "spoke_vnet_name" {
  type        = string
  description = "Spoke VNet name"
}

variable "spoke_vnet_id" {
  type        = string
  description = "Spoke VNet ID"
}
