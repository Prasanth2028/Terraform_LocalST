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
  default     = "terraform"
}

variable "satags" {
  description = "values for storage account tags"
  type        = map(string)
  default = {
    environment = "Production"
    project     = "Terraform"
    created_by  = "Terraform Script"
    purpose     = "Storage Account Creation"
  }
}