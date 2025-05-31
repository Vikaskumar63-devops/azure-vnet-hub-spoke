# Azure VNet and Hub-Spoke Architecture Project

## Overview

This project demonstrates two parts of Azure networking setups using Terraform:

- **Part A:** Single Virtual Network (VNet) with two subnets  
  - Subnet-1: Contains Linux and Windows VMs  
  - Subnet-2: Contains SQL Database (Azure SQL Server)  

- **Part B:** Hub-Spoke Architecture with 4 VNets and peering  
  - Management VNet (Hub)  
  - Production VNet (Spoke)  
  - Testing VNet (Spoke)  
  - Developing VNet (Spoke)  

In Part B, VNets are peered to enable connectivity between the Hub and Spokes. A VM in Management VNet (Hub) is used to verify network connectivity by pinging VMs in each spoke.

---

## Prerequisites

- Azure subscription with enough quota for VMs, VNets, and SQL resources  
- Terraform installed (version >= 1.0)  
- Azure CLI installed and logged in (`az login`)  

---

## Repository Structure

