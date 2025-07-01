variable "resource_group_names" {
  description = "List of resource group names to create."
  type        = list(string)
  default     = ["Resource_Group_Terraform_01", "Resource_Group_Terraform_02"]
}

variable "location" {
  description = "The Azure location where the resource groups will be created."
  type        = string
  default     = "East US"
}
