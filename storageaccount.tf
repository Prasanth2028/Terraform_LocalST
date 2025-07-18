module "storageaccount" {
  source                   = "git::https://github.com/ModuleASDA/terraform-StorageAccount.git"
  name                     = "${local.prefix}${var.storage_account_name}01"
  location                 = azurerm_resource_group.main["Resource_Group_Terraform_02"].location
  resource_group_name      = azurerm_resource_group.main["Resource_Group_Terraform_02"].name
  account_tier             = "Standard"
  replication_type         = "LRS"
  tags                     = var.satags
  shared_access_key_enabled = true
}