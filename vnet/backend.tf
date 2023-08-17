terraform {
  backend "azurerm" {
    resource_group_name  = "RG_India"
    storage_account_name = "azmonitoring"
    container_name       = "volpay"
    key                  = "test/terraform.tfstate"
  }
}
