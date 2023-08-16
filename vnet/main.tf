resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name"
  location            = var.vnet_location
  resource_group_name = var.vnet_resource_group_name
  address_space       = var.vnet_address_space
  dns_servers         = var.vnet_dns_servers

/*  subnet {
    name           = var.vnet_"subnet1"
    address_prefix = var.vnet_address_prefix
  }*/

  tags = {
    environment = "Production"
  }
}