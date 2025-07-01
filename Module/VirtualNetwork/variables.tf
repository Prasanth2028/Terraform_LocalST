variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure location."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}

variable "dns_servers" {
  description = "The DNS servers for the virtual network."
  type        = list(string)
  default     = []
}

variable "nsg_name" {
  description = "The name of the network security group."
  type        = string
}

variable "subnet1_name" {
  description = "The name of the first subnet."
  type        = string
}

variable "subnet1_address_prefixes" {
  description = "The address prefixes for the first subnet."
  type        = list(string)
}

variable "subnet2_name" {
  description = "The name of the second subnet."
  type        = string
}

variable "subnet2_address_prefixes" {
  description = "The address prefixes for the second subnet."
  type        = list(string)
}

variable "tags" {
  description = "Tags to assign to the virtual network and NSG."
  type        = map(string)
  default     = {}
}
