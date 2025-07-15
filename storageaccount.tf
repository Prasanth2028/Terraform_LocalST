module "storageaccount" {
  source                   = "github.com/ModuleASDA/terraform-StorageAccount"
  name                     = "${local.prefix}-${var.storage_account_name}-01"
  location                 = azurerm_resource_group.main["Resource_Group_Terraform_02"].location
  resource_group_name      = azurerm_resource_group.main["Resource_Group_Terraform_02"].name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}