module "key_vault_advanced" {
  source                          = "./terraform-azure-key-vault"
  resource_group_name             = "rg-prod"
  key_vault_name                  = "kv-prod-app"
  sku_name                        = "premium"
  region                          = "westeurope"
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  environment                     = "prod"
  purge_protection_enabled        = true
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  enable_rbac_authorization       = true
  soft_delete_retention_days      = 90

  access_policies = [
    {
      object_id               = "11111111-1111-1111-1111-111111111111"
      key_permissions         = "get,list"
      secret_permissions      = "get,list,set"
      certificate_permissions = "get,list"
      storage_permissions     = ""
    },
    {
      object_id               = "22222222-2222-2222-2222-222222222222"
      key_permissions         = "get"
      secret_permissions      = "get"
      certificate_permissions = ""
      storage_permissions     = ""
    }
  ]

  contacts = [
    {
      email = "security@example.com"
      name  = "Security Team"
    }
  ]

  network_acls = [
    {
      bypass                     = "AzureServices"
      default_action             = "Deny"
      ip_rules                   = []
      virtual_network_subnet_ids = ["/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-prod/providers/Microsoft.Network/virtualNetworks/vnet-prod/subnets/app-subnet"]
    }
  ]

  keys = [
    {
      name     = "encryption-key"
      key_type = "RSA"
      key_size = 2048
      key_opts = "encrypt,decrypt,sign,verify"
    }
  ]

  secrets = [
    {
      name  = "connection-string"
      value = "Server=tcp:db.example.net,1433;Database=appdb;"
    }
  ]

  default_tags = {
    environment = "prod"
    project     = "secure-app"
  }
}
