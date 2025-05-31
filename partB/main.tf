terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create VNets (Hub and Spokes)
module "management_vnet" {
  source              = "./modules/vnet"
  vnet_name           = "Management-VNet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
  subnet_name         = "management-subnet"
  subnet_prefixes     = ["10.0.1.0/24"]
}

module "production_vnet" {
  source              = "./modules/vnet"
  vnet_name           = "Production-VNet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.1.0.0/16"]
  subnet_name         = "production-subnet"
  subnet_prefixes     = ["10.1.1.0/24"]
}

module "testing_vnet" {
  source              = "./modules/vnet"
  vnet_name           = "Testing-VNet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.2.0.0/16"]
  subnet_name         = "testing-subnet"
  subnet_prefixes     = ["10.2.1.0/24"]
}

module "developing_vnet" {
  source              = "./modules/vnet"
  vnet_name           = "Developing-VNet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.3.0.0/16"]
  subnet_name         = "developing-subnet"
  subnet_prefixes     = ["10.3.1.0/24"]
}

# Create VMs in each VNet (Linux for simplicity)
module "management_vm" {
  source              = "./modules/vm"
  vm_name             = "management-vm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = module.management_vnet.subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "production_vm" {
  source              = "./modules/vm"
  vm_name             = "production-vm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = module.production_vnet.subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "testing_vm" {
  source              = "./modules/vm"
  vm_name             = "testing-vm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = module.testing_vnet.subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "developing_vm" {
  source              = "./modules/vm"
  vm_name             = "developing-vm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = module.developing_vnet.subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

# Peering Hub <-> Spokes
module "peer_management_production" {
  source              = "./modules/peering"
  resource_group_name = azurerm_resource_group.rg.name
  hub_vnet_name       = module.management_vnet.vnet_name
  hub_vnet_id         = module.management_vnet.vnet_id
  spoke_vnet_name     = module.production_vnet.vnet_name
  spoke_vnet_id       = module.production_vnet.vnet_id
}

module "peer_management_testing" {
  source              = "./modules/peering"
  resource_group_name = azurerm_resource_group.rg.name
  hub_vnet_name       = module.management_vnet.vnet_name
  hub_vnet_id         = module.management_vnet.vnet_id
  spoke_vnet_name     = module.testing_vnet.vnet_name
  spoke_vnet_id       = module.testing_vnet.vnet_id
}

module "peer_management_developing" {
  source              = "./modules/peering"
  resource_group_name = azurerm_resource_group.rg.name
  hub_vnet_name       = module.management_vnet.vnet_name
  hub_vnet_id         = module.management_vnet.vnet_id
  spoke_vnet_name     = module.developing_vnet.vnet_name
  spoke_vnet_id       = module.developing_vnet.vnet_id
}
