output "id" {
  description = "The ID of the Key Vault."
  value       = azurerm_key_vault.main.id
  sensitive   = false
}
output "key_vault_uri" {
  description = "The URI of the Key Vault, used for performing operations on keys and secrets."
  value       = azurerm_key_vault.main.vault_uri
  sensitive   = false
}

output "name" {
  description = "The name of the Key Vault."
  value       = azurerm_key_vault.main.name
}

output "resource_group_name" {
  description = "The name of the Resource Group in which the Key Vault exists."
  value       = azurerm_key_vault.main.resource_group_name
}

output "location" {
  description = "The Azure Region in which the Key Vault exists."
  value       = azurerm_key_vault.main.location
}