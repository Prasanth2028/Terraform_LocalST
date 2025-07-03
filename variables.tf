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