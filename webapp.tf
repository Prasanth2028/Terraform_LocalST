resource "azurerm_app_service_plan" "webapp_plan" {
  name                = "webapp-free-plan"
  location            = azurerm_resource_group.main["Resource_Group_Terraform_02"].location
  resource_group_name = azurerm_resource_group.main["Resource_Group_Terraform_02"].name
  sku {
    tier = "Free"
    size = "F1"
  }
}

module "webapp" {
  source                = "github.com/ModuleASDA/terraform-azurerm-web-app"
  name                  = "my-webapp"
  resource_group_name   = azurerm_resource_group.main["Resource_Group_Terraform_02"].name
  location              = azurerm_resource_group.main["Resource_Group_Terraform_02"].location
  app_service_plan_id   = azurerm_app_service_plan.webapp_plan.id
  # Add other required variables as needed by the module
}