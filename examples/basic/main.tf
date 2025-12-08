module "key_vault_basic" {
  source                          = "./terraform-azure-key-vault"
  resource_group_name             = "rg-example"
  key_vault_name                  = "kv-dev-app"
  sku_name                        = "standard"
  region                          = "westeurope"
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  environment                     = "dev"
  purge_protection_enabled        = false
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = false
  enabled_for_template_deployment = false
  enable_rbac_authorization       = false
  soft_delete_retention_days      = 7
  access_policies = [
    {
      object_id               = "00000000-0000-0000-0000-000000000000"
      key_permissions         = "get,list"
      secret_permissions      = "get,list,set"
      certificate_permissions = ""
      storage_permissions     = ""
    }
  ]

  contacts = [
    {
      email = "admin@example.com"
      name  = "Admin"
    }
  ]

  network_acls = [
    {
      bypass         = "AzureServices"
      default_action = "Allow"
      ip_rules       = ["192.168.0.0/24"]
    }
  ]

  keys = []

  secrets = [
    {
      name  = "app-secret"
      value = "supersecretvalue"
    },
    {
      name  = "db-password"
      value = "StrongP@ssw0rd!"
    }
  ]

  default_tags = {
    environment = "dev"
    project     = "example"
  }
}
