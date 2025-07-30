resource "random_password" "vm_password" {
  length           = 24
  special          = true
  override_special = "!@#$%&"
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
}

resource "azurerm_key_vault_secret" "vm_admin_password" {
  # Note: This assumes your Key Vault module has an output named `key_vault_id`.
  # If the output name is different, please adjust the reference below.
  key_vault_id = module.keyvault.key_vault_id
  name         = "${var.vm_name}-admin-password"
  value        = random_password.vm_password.result

  depends_on = [
    module.keyvault
  ]
}
