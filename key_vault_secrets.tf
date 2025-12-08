resource "azurerm_key_vault_secret" "main" {
  for_each        = { for secret in var.secrets : secret.name => secret }
  key_vault_id    = azurerm_key_vault.main.id
  name            = each.value.name
  value           = each.value.value
  content_type    = lookup(each.value, "content_type", null)
  not_before_date = lookup(each.value, "not_before_date", null)
  expiration_date = lookup(each.value, "expiration_date", null)
}