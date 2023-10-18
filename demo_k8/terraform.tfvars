

# VPC

basename                            = "test"
location                            = "Central India"
resource_group_name                 = "Cloud_Asset_Platform-RG-7KBNA"
address_space                       = ["10.0.0.0/8"]
dns_servers                         = ["10.0.0.4","10.0.0.5"]
tags                                = {
    environment = "test"
 }


 # Subnet

 name                               = "subnet-test"
 subnet_resource_group_name         = "RG_India"
 vnet_name                          = "vnet-test"
 address_prefixes                   = ["10.0.0.0/16"]

 # Network Security Group

 secgroupname                       = "testgroup"
 secgroup_location                  = "Central India"
 secgroup_resource_group_name       = "RG_India"
 sec_tags                           = {
    environment = "test"
 }

 # Network Security Rule

network_security_group_name	        = "nsg-testgroup"
secrule_name			            = "test123"
priority			                = 100
direction			                = "Inbound"
access			                    = "Allow"
protocol			                = "Tcp"
source_port_range		            = ["443","80"]
destination_port_range              = ["443","80"]
source_address_prefix	            = "*"
destination_address_prefix          = "*"
secrule_resource_group_name	        = "RG_India"

# Kubernetes Cluster

kubernetes_cluster_name				= "testcluster"
kubernetes_cluster_location			= "Central India"
kubernetes_cluster_resource_group_name	= "RG_India"
kubernetes_cluster_dns_prefix		= "testdns"
kubernetes_cluster_node_pool_name	= "testnodepool"
kubernetes_cluster_node_count		= 2
kubernetes_cluster_vm_size			= "Standard_D2_v2"
kubernetes_cluster_identity_type	= "SystemAssigned"
 kubernetes_cluster_tags                    = {
    "Project Owner" : "RG_India"
 }
