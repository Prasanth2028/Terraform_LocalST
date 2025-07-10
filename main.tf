terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "RG-02"
    storage_account_name = "saterraformstatefile001"
    container_name       = "tfstate"
    key                  = "terraformv2.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "292ccf82-092b-41c5-8723-0bbfad3a4080"
}

resource "azurerm_resource_group" "main" {
  for_each = toset(var.resource_group_names)
  name     = each.value
  location = var.location
  tags     = var.tags # Uncomment and define var.tags in variables.tf if you want to use tags
}


#dddd