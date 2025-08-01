module "keyvault" {
  #source                  = "git::https://github.com/ModuleASDA/Key-Vault.git" used as PAT token 
  source                   = "git@github.com:ModuleASDA/Key-Vault.git?ref=V-4.0"
  purge_protection_enabled = false
  key_vault_sku_name       = "standard"
  key_vault_name           = "KeyVault-Terraform-01"
  key_vault_location       = azurerm_resource_group.main["Resource_Group_Terraform_02"].location
  key_vault_rg_name        = azurerm_resource_group.main["Resource_Group_Terraform_02"].name
  enable_disk_encryption   = true
  #tenant_id               = data.azurerm_client_config.current.tenant_id
}