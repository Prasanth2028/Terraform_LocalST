terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
  # No backend block, so state will be stored locally
}

provider "azurerm" {
  features {}
  subscription_id = "292ccf82-092b-41c5-8723-0bbfad3a4080"
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}
