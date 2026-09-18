# Example: Advanced -- Azure Key Vault

Deploys a premium Key Vault with network ACLs, purge protection, disk encryption support and a pre-seeded secret.

```hcl
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
  enabled_for_disk_encryption     = true

  network_acls = [
    {
      bypass         = "AzureServices"
      default_action = "Deny"
      ip_rules       = ["203.0.113.0/24"]
    }
  ]

  default_tags = {
    environment = "prod"
    managed_by  = "terraform"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | github.com/Think-Cube/terraform-azure-key-vault | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->