resource "azurerm_key_vault_key" "main" {
  for_each        = { for key in var.keys : key.name => key }
  key_vault_id    = azurerm_key_vault.main.id
  name            = each.value.name
  key_type        = each.value.key_type
  key_size        = lookup(each.value, "key_size", null)
  curve           = lookup(each.value, "curve", null)
  key_opts        = lookup(each.value, "key_opts", "") == "" ? null : split(",", each.value.key_opts)
  not_before_date = lookup(each.value, "not_before_date", null)
  expiration_date = lookup(each.value, "expiration_date", null)
}