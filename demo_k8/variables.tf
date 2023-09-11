

# VPC

variable "basename" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,75}$", var.basename)) && can(regex("[\\w]+$", var.basename))
    error_message = "The name for the virtual network must be between 1 and 75 characters and must end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.resource_group_name)) && can(regex("[-\\w\\(\\)]+$", var.resource_group_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
}

variable "location" {
  type        = string
  description = "Location of the resource group."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags which should be assigned to the deployed resource."
  default     = {}
}

variable "module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "address_space" {
  type        = list(string)
  description = "The address space that is used the virtual network."
  validation {
    condition     = length(var.address_space) == 0 || alltrue([for v in var.address_space : can(regex("^(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9])[.]){3}(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9]))\\/([0-9]|[12][0-9]|3[0-2])$", v))])
    error_message = "Invalid IP range in CIDR format found in the list."
  }
}

variable "dns_servers" {
  type        = list(string)
  description = "List of DNS servers to use for virtual network."
#   validation {
#     condition     = length(var.dns_servers) == 0 || alltrue([for v in var.dns_servers : can(regex("^(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9])[.]){3}(([2]([0-4][0-9]|[5][0-5])|[0-1]?[0-9]?[0-9]))\\/([0-9]|[12][0-9]|3[0-2])$", v))])
#     error_message = "Invalid IP range in CIDR format found in the list."
#   }
  default = []
}

variable "ddos_protection_plan" {
  description = "A ddos_protection_plan id ."
  type        = map(string)
  default     = {}
}

# Subnet

variable "subnet_resource_group_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.subnet_resource_group_name)) && can(regex("[-\\w\\(\\)]+$", var.subnet_resource_group_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network to which to attach the subnet."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,80}$", var.vnet_name)) && can(regex("^[0-9a-zA-Z]+", var.vnet_name)) && can(regex("[\\w]+$", var.vnet_name))
    error_message = "The name for the virtual network must be between 1 and 80 characters and must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}


variable "subnet_module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "name" {
  type        = string
  description = "Name of the subnet."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,80}$", var.name)) && can(regex("^[0-9a-zA-Z]+", var.name)) && can(regex("[\\w]+$", var.name))
    error_message = "The name for the subnet must be between 1 and 80 characters and must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}

variable "address_prefixes" {
  type        = list(string)
  description = "The address prefixes to use for the subnet."
}

# Network Security Groups

variable "secgroupname" {
  type        = string
  description = "Basename of the module."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,60}$", var.secgroupname)) && can(regex("[\\w]+$", var.secgroupname))
    error_message = "The name must be between 1 and 60 characters, must end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}

variable "secgroup_resource_group_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.secgroup_resource_group_name)) && can(regex("[-\\w\\(\\)]+$", var.secgroup_resource_group_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
}

variable "secgroup_location" {
  type        = string
  description = "Location of the resource group."
}

variable "sec_tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource."
}

variable "secgroup_module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

# Network Security Rule

variable "secrule_resource_group_name" {
  type        = string
  description = "Resource group name."
  validation {
    condition     = can(regex("^[-\\w\\.\\(\\)]{1,90}$", var.secrule_resource_group_name)) && can(regex("[-\\w\\(\\)]+$", var.secrule_resource_group_name))
    error_message = "Resource group names must be between 1 and 90 characters and can only include alphanumeric, underscore, parentheses, hyphen, period (except at end)."
  }
}

variable "secrule_name" {
  type        = string
  description = "The name of the security rule."
  validation {
    condition     = can(regex("^[-\\w\\.]{1,80}$", var.secrule_name)) && can(regex("^[0-9a-zA-Z]+", var.secrule_name)) && can(regex("[\\w]+$", var.secrule_name))
    error_message = "The name must be between 1 and 80 characters, must begin with a letter or number, end with a letter, number or underscore, and may contain only letters, numbers, underscores, periods, or hyphens."
  }
}

variable "secrule_module_enabled" {
  type        = bool
  description = "Variable to enable or disable the module."
  default     = true
}

variable "priority" {
  type        = number
  description = "Specifies the priority of the rule."
}

variable "direction" {
  type        = string
  description = "The direction specifies if rule will be evaluated on incoming or outgoing traffic."
}

variable "access" {
  type        = string
  description = "Specifies whether network traffic is allowed or denied."
}

variable "protocol" {
  type        = string
  description = "Network protocol this rule applies to."
}

variable "source_port_range" {
 
  description = "List of source ports or port ranges."
}

variable "destination_port_range" {
  
  description = "List of destination ports or port ranges."
  default     = []
}

variable "source_address_prefix" {
  type        = string
  description = "CIDR or destination IP range or * to match any IP."
}

variable "destination_address_prefix" {
  type        = string
  description = "List of destination address prefixes."
}

variable "network_security_group_name" {
  type        = string
  description = "The name of the Network Security Group that we want to attach the rule to."
}

variable "secrule_tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource."
}

# Kuberenetes Cluster

variable "kubernetes_cluster_name" {
  
}
variable "kubernetes_cluster_location" {
  
}
variable "kubernetes_cluster_resource_group_name" {
  
}
variable "kubernetes_cluster_dns_prefix" {
  
}
variable "kubernetes_cluster_node_pool_name" {
  
}
variable "kubernetes_cluster_node_count" {
  
}
variable "kubernetes_cluster_vm_size" {
  
}
variable "kubernetes_cluster_identity_type" {
  
}
variable "kubernetes_cluster_tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the deployed resource."
}
