variable "resource_group_names" {
  description = "List of resource group names to create."
  type        = list(string)
  default     = ["Resource_Group_Terraform_01", "Resource_Group_Terraform_02", "Resource_Group_Terraform_03"]
}

variable "location" {
  description = "The Azure location where the resource groups will be created."
  type        = string
  default     = "East US"
}

variable "tags" {
  description = "Tags to apply to the resource groups."
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "Terraform"
    created_by  = "Terraform Script"
    purpose     = "Resource Group Creation"
  }

}

variable "storage_account_name" {
  description = "The name of the storage account to create."
  type        = string
  default     = "saaccountterraform01" # More unique default to avoid naming collisions
}

variable "storage_account_tags" {
  description = "Tags to apply to the storage account."
  type        = map(string)
  default = {
    environment = "Production"
    project     = "Terraform"
    created_by  = "Terraform Script"
    purpose     = "Storage Account Creation"
  }
}

variable "vm_name" {
  description = "Name for the virtual machine."
  type        = string
  default     = "vm-terraform-01"
}

variable "vm_size" {
  description = "Size (SKU) of the virtual machine."
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "Administrator username for the virtual machine. "
  type        = string
  default     = "azureuser"
}
