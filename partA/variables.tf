variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "rg-partA"
}

variable "location" {
  description = "Azure Location"
  type        = string
  default     = "eastus"
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "vnet-partA"
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
  default     = "vikas-kumar"
}

variable "admin_password" {
  description = "Admin password for VMs"
  type        = string
  sensitive   = true
}
