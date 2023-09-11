# VPC

resource "azurerm_virtual_network" "azure_vnet" {
  name                = "vnet-${var.basename}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan
    content {
      id     = lookup(ddos_protection_plan.value, "id", null)
      enable = lookup(ddos_protection_plan.value, "enable", false)
    }
  }
  tags = var.tags

  count = var.module_enabled ? 1 : 0
}

# Subnet

resource "azurerm_subnet" "azure_snet" {
  name                                          = var.name
  resource_group_name                           = var.subnet_resource_group_name
  virtual_network_name                          = var.vnet_name
  address_prefixes                              = var.address_prefixes
 depends_on = [azurerm_virtual_network.azure_vnet]
  count = var.subnet_module_enabled ? 1 : 0
}

# Network Security Group

resource "azurerm_network_security_group" "azure_nsg" {
  name                = "nsg-${var.secgroupname}"
  location            = var.secgroup_location
  resource_group_name = var.secgroup_resource_group_name
  tags                = var.sec_tags
  depends_on = [azurerm_virtual_network.azure_vnet]
  count = var.module_enabled ? 1 : 0
}

# Network Security Rule

resource "azurerm_network_security_rule" "azure_nsgsr" {
  name                        = var.secrule_name
  priority                    = var.priority
  direction                   = var.direction
  access                      = var.access
  protocol                    = var.protocol
  source_port_ranges          = var.source_port_range
  destination_port_ranges     = var.destination_port_range
  source_address_prefix       = var.source_address_prefix
  destination_address_prefix  = var.destination_address_prefix
  resource_group_name         = var.secrule_resource_group_name
  network_security_group_name = var.network_security_group_name
  depends_on = [azurerm_network_security_group.azure_nsg]
  count = var.secrule_module_enabled ? 1 : 0
}

# Kubernetes Cluster

resource "azurerm_kubernetes_cluster" "azure_kcluster" {
  name                = var.kubernetes_cluster_name
  location            = var.kubernetes_cluster_location
  resource_group_name = var.kubernetes_cluster_resource_group_name
  dns_prefix          = var.kubernetes_cluster_dns_prefix

  default_node_pool {
    name       = var.kubernetes_cluster_node_pool_name
    node_count = var.kubernetes_cluster_node_count
    vm_size    = var.kubernetes_cluster_vm_size
  }

  identity {
    type = var.kubernetes_cluster_identity_type
  }

  tags                = var.kubernetes_cluster_tags
  depends_on = [azurerm_network_security_rule.azure_nsgsr]
}
