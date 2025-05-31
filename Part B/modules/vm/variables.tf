variable "vm_name" {
  type        = string
  description = "Name of the VM"
}

variable "location" {
  type        = string
  description = "Azure location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to place NIC"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "VM size"
}

variable "admin_username" {
  type        = string
  description = "Admin username"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Admin password"
}
