resource "azurerm_kubernetes_cluster" "example" {
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

  tags = {
    Environment = "Production"
    Project Owner = "RG_India"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}
