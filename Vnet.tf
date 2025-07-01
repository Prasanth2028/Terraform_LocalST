module "virtual_network" {
  source              = "./Module/VirtualNetwork"
  resource_group_name = azurerm_resource_group.main["Resource_Group_Terraform_02"].name
  location            = azurerm_resource_group.main["Resource_Group_Terraform_02"].location
  vnet_name           = "virtual-network-terraform-01"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  subnets = [
    {
      name             = "subnet1"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "subnet2"
      address_prefixes = ["10.0.2.0/24"]
    }
  ]
  tags = {
    environment = "Production"
  }
}
