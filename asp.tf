#terraform import azurerm_app_service_plan.example /subscriptions/292ccf82-092b-41c5-8723-0bbfad3a4080/resourceGroups/Resource_Group_Terraform_01/providers/Microsoft.Web/serverFarms/ASP-manual-01
# Import the existing App Service Plan into Terraform state
resource "azurerm_app_service_plan" "example" {
  name                = "ASP-manual-01"
  location            = "Canada Central"
  resource_group_name = "Resource_Group_Terraform_01"
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}


