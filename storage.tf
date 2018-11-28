resource "azurerm_storage_account" "ca_storage" {
  name                     = "convanalysis"
  resource_group_name      = "${azurerm_resource_group.converstational_analysis.name}"
  location                 = "${azurerm_resource_group.converstational_analysis.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

#--------------Audio Storage-------------------------

resource "azurerm_storage_container" "audio_container" {
  name                  = "ca-audio-container"
  resource_group_name   = "${azurerm_resource_group.converstational_analysis.name}"
  storage_account_name  = "${azurerm_storage_account.ca_storage.name}"
  container_access_type = "private"
}

#--------------Text Storage---------------------------

resource "azurerm_storage_container" "text_container" {
  name                  = "ca-text-container"
  resource_group_name   = "${azurerm_resource_group.converstational_analysis.name}"
  storage_account_name  = "${azurerm_storage_account.ca_storage.name}"
  container_access_type = "private"
}
