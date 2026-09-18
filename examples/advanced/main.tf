data "azurerm_client_config" "current" {}

module "key_vault" {
  source = "github.com/Think-Cube/terraform-azure-key-vault?ref=v1.0.0"

  key_vault_name          = "kv-example-adv-001"
  resource_group_name     = "rg-example"
  resource_group_location = "West Europe"
  tenant_id               = data.azurerm_client_config.current.tenant_id
  sku_name                = "premium"

  rbac_authorization_enabled      = true
  purge_protection_enabled        = true
  soft_delete_retention_days      = 90
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true

  network_acls = [
    {
      bypass                     = "AzureServices"
      default_action             = "Deny"
      ip_rules                   = ["203.0.113.0/24"]
      virtual_network_subnet_ids = [
        "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.Network/virtualNetworks/vnet-main/subnets/snet-app"
      ]
    }
  ]

  secrets = [
    {
      name         = "db-password"
      value        = "REPLACE_ME"
      content_type = "text/plain"
    }
  ]

  default_tags = {
    environment = "prod"
    managed_by  = "terraform"
  }
}