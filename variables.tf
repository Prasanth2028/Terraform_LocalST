variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "Resource_Group_Terraform_01"
}

variable "location" {
  description = "The Azure location where the resource group will be created."
  type        = string
  default     = "East US"
}
