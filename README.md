## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.57.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.57.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.57.0/docs/resources/key_vault) | resource |
| [azurerm_key_vault_key.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.57.0/docs/resources/key_vault_key) | resource |
| [azurerm_key_vault_secret.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.57.0/docs/resources/key_vault_secret) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.57.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/4.57.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | List of objects that represent the configuration of each access policies. | `list(map(string))` | `[]` | no |
| <a name="input_contacts"></a> [contacts](#input\_contacts) | List of objects that represent each contact. | `list(map(string))` | `[]` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A mapping of tags to assign to the resource. | `map(any)` | n/a | yes |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions. | `bool` | `false` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. | `bool` | `false` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Var used for backend container name key | `string` | `"dev"` | no |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | Specifies the name of the Key Vault. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_keys"></a> [keys](#input\_keys) | List of objects that represent the configuration of each key. | `list(map(string))` | `[]` | no |
| <a name="input_network_acls"></a> [network\_acls](#input\_network\_acls) | A list of network ACLs. | <pre>list(object({<br/>    bypass                     = optional(string)<br/>    default_action             = optional(string)<br/>    ip_rules                   = optional(list(string))<br/>    virtual_network_subnet_ids = optional(list(string))<br/>  }))</pre> | `[]` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Is Purge Protection enabled for this Key Vault? | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | Region in which resources are deployed | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the virtual network. | `string` | n/a | yes |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | List of objects that represent the configuration of each secrect. | `list(map(string))` | `[]` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The Name of the SKU used for this Key Vault. Possible values are standard and premium. | `string` | n/a | yes |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 days. | `number` | `90` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Key Vault. |
| <a name="output_key_vault_uri"></a> [key\_vault\_uri](#output\_key\_vault\_uri) | The URI of the Key Vault, used for performing operations on keys and secrets. |
