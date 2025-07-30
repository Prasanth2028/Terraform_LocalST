module "virtual-machine" {
  source              = "Azure/virtual-machine/azurerm"
  version             = "2.0.0"
  resource_group_name = azurerm_resource_group.main["Resource_Group_Terraform_02"].name
  location            = azurerm_resource_group.main["Resource_Group_Terraform_02"].location
  name                = var.vm_name
  admin_username      = var.admin_username
  admin_password      = random_password.vm_password.result
  subnet_id           = module.virtual_network.subnet1_id
  size                = var.vm_size
  image_os            = "windows"
  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}