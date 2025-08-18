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
  default     = "saaccountterraform01"
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
  default     = "Standard_B1s" # A cost-effective burstable size for testing.
}

variable "admin_username" {
  description = "Administrator username for the virtual machine. "
  type        = string
  default     = "azureuser"
}

variable "vms" {
  type = list(object({
    name           = string,
    size           = string,
    admin_username = string,
    admin_password = string,
    subnet_id      = string,
    image_os       = string,
    os_simple      = string,
    os_disk = object({
      caching              = string,
      storage_account_type = string,
    }),
    source_image_reference = optional(object({
      publisher = string,
      offer     = string,
      sku       = string,
      version   = string
    })),
    tags = optional(map(string))
  network_interface_ids = optional(list(string)) }))
  default = [
    {
      name           = "vm-terraform-02"
      size           = "Standard_B1s"
      admin_username = "azureuser"
      admin_password = "P@ssw0rd1234!"
      subnet_id      = ""
      image_os       = "windows"
      os_simple      = "WindowsServer"
      os_disk = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
      source_image_reference = {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2019-Datacenter"
        version   = "latest"
      }
      tags = {
        environment = "Production"
        project     = "Terraform"
        created_by  = "Terraform Script"
        purpose     = "Virtual Machine Creation"
      }
    }
    # {
    #   name           = "vm-terraform-03"
    #   size           = "Standard_B1s"
    #   admin_username = "azureuser"
    #   admin_password = "P@ssw0rd1234!"
    #   subnet_id      = ""
    #   image_os       = "windows"
    #   os_simple      = "WindowsServer"
    #   os_disk = {
    #     caching              = "ReadWrite"
    #     storage_account_type = "Standard_LRS"
    #   }
    #   source_image_reference = {
    #     publisher = "MicrosoftWindowsServer"
    #     offer     = "WindowsServer"
    #     sku       = "2019-Datacenter"
    #     version   = "latest"
    #   }
    #   tags = {
    #     environment = "Production"
    #     project     = "Terraform"
    #     created_by  = "Terraform Script"
    #     purpose     = "Virtual Machine Creation"
    #   }
    # }
  ]
}
