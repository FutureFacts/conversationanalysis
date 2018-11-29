resource "azurerm_app_service_plan" "ca_automation" {
  name                = "ca-automation-service-plan"
  location            = "${azurerm_resource_group.converstational_analysis.location}"
  resource_group_name = "${azurerm_resource_group.converstational_analysis.name}"
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "function-ca-audio-upload" {
  name                      = "function-ca-audio-upload"
  location                  = "${azurerm_resource_group.converstational_analysis.location}"
  resource_group_name       = "${azurerm_resource_group.converstational_analysis.name}"
  app_service_plan_id       = "${azurerm_app_service_plan.ca_automation.id}"
  storage_connection_string = "${azurerm_storage_account.ca_storage.primary_connection_string}"

  app_settings = {
  "WEBSITE_RUN_FROM_ZIP" = "https://github.com/FutureFacts/conversationanalysis/tree/master/audio-upload-trigger"
  }
}
