# Part A - Single VNet with Two Subnets and VMs

This part creates:

- A resource group
- A virtual network with two subnets:
  - Subnet 1: Linux and Windows VMs
  - Subnet 2: SQL VM
- Virtual machines in each subnet

## Usage

1. Set the `admin_password` value securely (e.g., via `terraform.tfvars` or environment variable)
2. Run:
   ```bash
   terraform init
   terraform plan
   terraform apply
