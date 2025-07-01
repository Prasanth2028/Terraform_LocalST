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

variable "subnets" {
  description = "A list of subnets to create."
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))
}

variable "tags" {
  description = "Tags to assign to the virtual network."
  type        = map(string)
  default     = {}
}
