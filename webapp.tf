resource "azurerm_app_service_plan" "webapp_plan" {
  name                = "webapp-free-plan"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.main["Resource_Group_Terraform_02"].name
  sku {
    tier = "Free"
    size = "F1"
  }
}

module "webapp" {
  source                            = "github.com/ModuleASDA/terraform-azurerm-web-app"
  app_name                          = "my-webapp-terraform-01"
  resource_group_name               = azurerm_resource_group.main["Resource_Group_Terraform_02"].name
  location                          = "westeurope"
  app_service_plan_id               = azurerm_app_service_plan.webapp_plan.id
  always_on                         = false
  ip_restriction_default_action     = "Allow"
  scm_ip_restriction_default_action = "Allow"
  # log_analytics_workspace_id is now optional and omitted
  # Add other required variables as needed by the module
}

resource "azurerm_linux_web_app" "example" {
  name                = "webapp-manual-01"
  resource_group_name = azurerm_app_service_plan.example.resource_group_name
  location            = azurerm_app_service_plan.example.location
  service_plan_id = azurerm_app_service_plan.example.id
  site_config {
    always_on = false
    }
  tags = {
    managed = "Terraform"
    resource = "WebApp"
  }
}