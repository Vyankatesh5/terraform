terraform {
  backend "azurerm" {
    resource_group_name  = "Cloud_Asset_Platform-RG-7KBNA"
    storage_account_name = "kaiburr"
    container_name       = "demo-kaiburr"
    key                  = "kcluster/terraform.tfstate"
    access_key         = "iMLPpa0HNzThJyih67nMVMb7DaJ4a/GD8VTETQpyQoc3GRjMwOlJSWwqEWUDT5YrhXzPSzhweqX5+AStT+jPkg=="

  }
}
