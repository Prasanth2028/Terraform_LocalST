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
  os_simple           = "WindowsServer"
  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  # source_image_reference = {
  #   publisher = "MicrosoftWindowsServer"
  #   offer     = "WindowsServer"
  #   sku       = "2019-Datacenter"
  #   version   = "latest"
  # }
}

resource "azurerm_virtual_machine" "vm01" {
  for_each = { for vm in var.vms : vm.name => vm }
  name                  = each.value.name
  location              = azurerm_resource_group.main["Resource_Group_Terraform_02"].location
  resource_group_name   = azurerm_resource_group.main["Resource_Group_Terraform_02"].name
  network_interface_ids = [azurerm_network_interface.main.id] 
  vm_size               = each.value.size

  storage_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }

  storage_os_disk {
    name              = "${each.value.name}-osdisk"
    caching           = each.value.os_disk.caching
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = each.value.name
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }
  tags = each.value.tags
}

resource "azurerm_network_interface" "main" {
  for_each              = { for vm in var.vms : vm.name => vm }
  count                 = length(var.vms)
  name                  = "${each.value.name}-nic"
  location              = azurerm_resource_group.main["Resource_Group_Terraform_02"].location
  resource_group_name   = azurerm_resource_group.main["Resource_Group_Terraform_02"].name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.manual_subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}