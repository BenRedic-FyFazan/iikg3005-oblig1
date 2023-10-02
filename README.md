# Terraform Infrastructure as Code (IaC) for Azure Resources

This Terraform project provisions and manages Azure resources including Virtual Network (VNET), Virtual Machine (VM), Storage Account, and Key Vault.

## Getting Started

### Prerequisites

- Terraform installed
- Azure subscription

### Initialization

1. Assign values to variable definitions located in the following files:
    - 'secret.auto.tfvars' 
    - 'variables.auto.tfvars'
    - 'locals.tf'
Any variable that is either commented out or has the "default = 'somevalue'" property in variables.tf is optional. 

2. Initialize the project - making sure all necessary dependencies are fetched.
```bash
terraform init
```

3. Plan the configuration and verify that everything looks in order
```bash
terraform plan -out="./deploy.tfplan"
```

4. Deploy the configuration - all variable definitions are automatically fetched from the variable files, and terraform automatically connects to azure via the supplied credentials in the secrets file.
```bash
terraform apply ./deploy.tfplan
```

5. Upon deployment completion, output will be printed to the terminal with the most important information, for example (most of these resource names has been generated randomly):
```
Outputs:

kv_name = "kv-ethical-sawfish"
network_security_group = "Bastion-Defence-System"
rg_location = "westeurope"
rg_name = "rg-westeurope-Wondermeal"
sa_name = "grandsparrow"
sa_primary_access_key = <sensitive>
sc_name = "sc-champion-dane"
subnets = {
  "subnet-current-albacore" = "10.0.1.0/24"
  "subnet-selected-chipmunk" = "10.0.0.0/24"
  "subnet-sweet-mink" = "10.0.2.0/24"
}
vm = {
  "name" = "vm-crane"
  "pip" = "52.166.242.204"
}
vm_credentials = <sensitive>
vnet_address_space = "10.0.0.0/16"
vnet_name = "Bastion"
```

## Modules
### Network Module 
Provisions a VNET, Subnet(s), and a Network Security Group to the supplied resource group.

### Storage Module
Provisions a storage Account with a storage container to the supplied resource group.

### VM Module
Provisions a Windows based virtual machine to the infrastructure. 

### Keyvault Module 
Provisions the infrastructure with an azure Keyvault.