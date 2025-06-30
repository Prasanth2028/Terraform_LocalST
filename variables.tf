variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  value      = "RG_01_TF"
}

variable "location" {
  description = "The Azure location where the resource group will be created."
  type        = string
  default     = "East US"
}
