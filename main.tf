# Configure the Azure Provider
provider "azurerm" {

}

resource "azurerm_resource_group" "converstational_analysis" {
  name     = "converstational_analysis"
  location = "West Europe"
}
