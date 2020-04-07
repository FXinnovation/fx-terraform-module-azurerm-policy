# terraform-module-azurerm-policy

## Usage
See `examples` folders for usage of this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azurerm | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| custom\_policies | One or more custom policies. | <pre>list(object({<br>    metadata    = string<br>    policy_rule = string<br>    parameters  = string<br>  }))</pre> | <pre>[<br>  null<br>]</pre> | no |
| custom\_policy\_definition\_enabled | Boolean flag which describes whether or not to enable Policy definition. | `bool` | `false` | no |
| custom\_policy\_descriptions | List of descriptions which define the Policy definitions. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| custom\_policy\_display\_names | List of Policy definition display names. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| custom\_policy\_management\_group\_ids | List of IDs of the management groups where this policy should be defined. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| custom\_policy\_modes | List of Policy modes that allows us to specify which resource types will be evaluated. The value can be `All`, `Indexed` or `NotSpecified`. Changing this resource forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| custom\_policy\_names | List of Policy definition names. Changing this force a new resourec to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| custom\_policy\_types | List of Policy types. The value can be `BuiltIn`, `Custom` or `NotSpecified`. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| enabled | Enable or disable modul | `bool` | `true` | no |
| existing\_policy\_definition\_ids | List of  IDs of the Policy Definition to be applied at the specified Scope | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| identity\_type | One or more identity blocks. Possible values for the policy assignment types are `SystemAssigned` (where Azure will generate a service principal for you), or None (no use of a managed service identity). | `string` | `"SystemAssigned"` | no |
| policy\_assignment\_descriptions | List of descriptions to use for the  Policy assignments. Changing this force a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_assignment\_display\_names | List of display names to use for this Policy Assignment. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_assignment\_enabled | Boolean flag which describes whether or not to enable the Policy assignment. | `bool` | `false` | no |
| policy\_assignment\_identity\_enabled | Boolean lag which describes whether to enable the identity block or not. | `list(bool)` | <pre>[<br>  false<br>]</pre> | no |
| policy\_assignment\_locations | List of Azure locations where this policy assignment should exist. This is required when an Identity is assigned. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_assignment\_names | A list of Policy assignment names.Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_assignment\_not\_scopes | A list of the Policy assignment's excluded scopes. The list must contain resource IDs (such as subscriptions e.g. `/subscriptions/00000000-0000-0000-000000000000` or resource groups e.g. `/subscriptions/00000000-0000-0000-000000000000/resourceGroups/myResourceGroup`). | `list(list(string))` | <pre>[<br>  []<br>]</pre> | no |
| policy\_assignment\_parameters | This is a JSON object that maps to the Parameters field from the Policy Definition. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_assignment\_parameters\_enabled | List of boolean flags which describes the policy assignments has parameters or not. | `list(bool)` | <pre>[<br>  false<br>]</pre> | no |
| policy\_assignments | List scopes and parameters at which the Policy Assignment should be applied, which must be a Resource ID (such as Subscription e.g. `/subscriptions/00000000-0000-0000-000000000000` or a Resource Group e.g. `/subscriptions/00000000-0000-0000-000000000000/resourceGroups/myResourceGroup`). Changing this forces a new resource to be created. | `list(object({ scope = string, parameters = string }))` | <pre>[<br>  null<br>]</pre> | no |
| policy\_initiative\_descriptions | A list which provides the decriptions for the policy initiatives. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_initiative\_display\_names | List of display names of the policy initiatives. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_initiative\_enabled | Boolean Flag which decribe whether or not enable the policy set definition. | `bool` | `false` | no |
| policy\_initiative\_management\_group\_ids | List of IDs of the management group where this policy should be defined. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_initiative\_names | List of name of the policy initiatives. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_initiative\_types | List of policy set types. Possible values are `BuiltIn` or `Custom`. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_initiatives | One or more policy initiatives. | <pre>list(object({<br>    policy_definitons = string<br>    metadata          = string<br>    parameters        = string<br>  }))</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| identities | n/a |
| policy\_assignment\_ids | The IDs of the Policy assignments. |
| policy\_definition\_ids | The IDs of the Policy definition. |
| policy\_set\_definition\_ids | The IDs of the Policy set definitions. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
