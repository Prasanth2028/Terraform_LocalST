resource "azurerm_app_service_plan" "webapp_plan" {
  name                = "webapp-free-plan"
  location            = azurerm_resource_group.main["Resource_Group_Terraform_02"].location
  resource_group_name = azurerm_resource_group.main["Resource_Group_Terraform_02"].name
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "my-webapp"
  location            = azurerm_resource_group.main["Resource_Group_Terraform_02"].location
  resource_group_name = azurerm_resource_group.main["Resource_Group_Terraform_02"].name
  service_plan_id     = azurerm_app_service_plan.webapp_plan.id
  site_config {
    always_on = false
    application_stack {
      python_version = "3.11"
    }
  }
}