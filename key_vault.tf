#tfsec:ignore:azure-keyvault-specify-network-acl
resource "azurerm_key_vault" "main" {
  name                       = var.key_vault_name
  resource_group_name        = data.azurerm_resource_group.rg.name
  location                   = data.azurerm_resource_group.rg.location
  sku_name                   = lower(var.sku_name)
  tenant_id                  = var.tenant_id
  soft_delete_retention_days = var.soft_delete_retention_days
  #tfsec:ignore:azure-keyvault-no-purge
  purge_protection_enabled        = var.purge_protection_enabled
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization
  tags                            = var.default_tags

  dynamic "access_policy" {
    for_each = var.access_policies
    content {
      tenant_id               = var.tenant_id
      object_id               = access_policy.value.object_id
      application_id          = lookup(access_policy.value, "application_id", null)
      key_permissions         = lookup(access_policy.value, "key_permissions", "") == "" ? null : split(",", access_policy.value.key_permissions)
      secret_permissions      = lookup(access_policy.value, "secret_permissions", "") == "" ? null : split(",", access_policy.value.secret_permissions)
      certificate_permissions = lookup(access_policy.value, "certificate_permissions", "") == "" ? null : split(",", access_policy.value.certificate_permissions)
      storage_permissions     = lookup(access_policy.value, "storage_permissions", "") == "" ? null : split(",", access_policy.value.storage_permissions)
    }
  }

  dynamic "contact" {
    for_each = var.contacts
    content {
      email = contact.value.email
      name  = lookup(contact.value, "name", null)
      phone = lookup(contact.value, "phone", null)
    }
  }

  dynamic "network_acls" {
    for_each = var.network_acls
    content {
      bypass                     = lookup(network_acls.value, "bypass", "AzureServices")
      default_action             = lookup(network_acls.value, "default_action", "Deny")
      ip_rules                   = lookup(network_acls.value, "ip_rules", [])
      virtual_network_subnet_ids = lookup(network_acls.value, "virtual_network_subnet_ids", [])
    }
  }
}