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
