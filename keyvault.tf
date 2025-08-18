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

resource "azurerm_key_vault_access_policy" "second_policy" {
  key_vault_id = module.keyvault.KeyVaultId
  tenant_id    = "d4963ce2-af94-4122-95a9-644e8b01624d"
  object_id    = "4add16bc-946b-44c2-8716-eb3da5a80366"

  key_permissions    = ["List"]
  secret_permissions = ["Get", "List"]
}