data "azurerm_client_config" "current" {}

module "key_vault" {
  source = "github.com/Think-Cube/terraform-azure-key-vault?ref=v1.0.0"

  key_vault_name          = "kv-example-001"
  resource_group_name     = "rg-example"
  resource_group_location = "West Europe"
  tenant_id               = data.azurerm_client_config.current.tenant_id
  sku_name                = "standard"

  rbac_authorization_enabled = true
  purge_protection_enabled   = false
  soft_delete_retention_days = 7

  default_tags = {
    environment = "dev"
    managed_by  = "terraform"
  }
}