terraform {
  backend "azurerm" {
    resource_group_name  = "RG_India"
    storage_account_name = "azmonitoring"
    container_name       = "demo-kaiburr"
    key                  = "kcluster/terraform.tfstate"
    access_key         = "rZX6WEeN8o9MyBUpfvTr524y7iV6/YA+DFFXcT2MQWgmMf+79jd+U4THV44b5glT/+ML04YIMlqR+ASt0ozSbA=="

  }
}
