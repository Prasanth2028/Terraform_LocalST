module "virtual_network" {
  source                   = "./Module/VirtualNetwork"
  resource_group_name      = azurerm_resource_group.main["Resource_Group_Terraform_02"].name
  location                 = azurerm_resource_group.main["Resource_Group_Terraform_02"].location
  vnet_name                = "virtual-network-terraform-01"
  address_space            = ["10.0.0.0/16"]
  dns_servers              = ["10.0.0.4", "10.0.0.5"]
  nsg_name                 = "nsg-terraform-01"
  subnet1_name             = "subnet-terraform-01"
  subnet1_address_prefixes = ["10.0.1.0/24"]
  subnet2_name             = "subnet-terraform-02"
  subnet2_address_prefixes = ["10.0.2.0/24"]
  tags = {
    environment = "Production"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet1_assoc" {
  subnet_id                 = module.virtual_network.subnet1_id
  network_security_group_id = module.virtual_network.nsg_id
}

resource "azurerm_subnet_network_security_group_association" "subnet2_assoc" {
  subnet_id                 = module.virtual_network.subnet2_id
  network_security_group_id = module.virtual_network.nsg_id
}

# Manual VNet and Subnets Creation with import from portal
#terraform import azurerm_virtual_network.manual /subscriptions/292ccf82-092b-41c5-8723-0bbfad3a4080/resourceGroups/Resource_Group_Terraform_01/providers/Microsoft.Network/virtualNetworks/virtual-network-manual-01
resource "azurerm_virtual_network" "manual" {
  name                = "virtual-network-manual-01"
  resource_group_name = "Resource_Group_Terraform_01"
  location            = "East US"
  address_space       = ["10.0.0.0/15"]
}

#terraform import azurerm_subnet.manual_subnet1 /subscriptions/292ccf82-092b-41c5-8723-0bbfad3a4080/resourceGroups/Resource_Group_Terraform_01/providers/Microsoft.Network/virtualNetworks/virtual-network-manual-01/subnets/Subnet1
#terraform import azurerm_subnet.manual_subnet2 /subscriptions/292ccf82-092b-41c5-8723-0bbfad3a4080/resourceGroups/Resource_Group_Terraform_01/providers/Microsoft.Network/virtualNetworks/virtual-network-manual-01/subnets/Subnet2
#terraform import azurerm_subnet.manual_subnet3 /subscriptions/292ccf82-092b-41c5-8723-0bbfad3a4080/resourceGroups/Resource_Group_Terraform_01/providers/Microsoft.Network/virtualNetworks/virtual-network-manual-01/subnets/Subnet3

resource "azurerm_subnet" "manual_subnet1" {
  name                 = "Subnet1"
  resource_group_name  = "Resource_Group_Terraform_01"
  virtual_network_name = azurerm_virtual_network.manual.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "manual_subnet2" {
  name                 = "Subnet2"
  resource_group_name  = "Resource_Group_Terraform_01"
  virtual_network_name = azurerm_virtual_network.manual.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "manual_subnet3" {
  name                 = "Subnet3"
  resource_group_name  = "Resource_Group_Terraform_01"
  virtual_network_name = azurerm_virtual_network.manual.name
  address_prefixes     = ["10.0.3.0/24"]
}
