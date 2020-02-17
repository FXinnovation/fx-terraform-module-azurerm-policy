# terraform-module-azurerm-policy

## Usage
See `examples` folders for usage of this module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| enabled | Enable or disable modul | `bool` | `true` | no |
| identities | One or more identity blocks. | `list` | `[]` | no |
| policy\_assignment\_definition\_ids | List of  IDs of the Policy Definition to be applied at the specified Scope | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_assignment\_descriptions | List of descriptions to use for the  Policy assignments. Changing this force a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_assignment\_display\_names | List of display names to use for this Policy Assignment. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_assignment\_enabled | Boolean flag which describes whether or not to enable the policy assignment. | `bool` | `false` | no |
| policy\_assignment\_locations | List of Azure locations where this policy assignment should exist. This is required when an Identity is assigned. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_assignment\_names | List of names of the Policy Assignment. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_assignment\_not\_scopes | A list of the Policy assignment's excluded scopes. The list must contain resource IDs (such as subscriptions e.g. `/subscriptions/00000000-0000-0000-000000000000` or resource groups e.g. `/subscriptions/00000000-0000-0000-000000000000/resourceGroups/myResourceGroup`). | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_assignment\_parameters | List of parameters for the policy definition. This field is a JSON object that maps to the Parameters field from the Policy Definition. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_assignment\_scopes | List of scopes at which the Policy Assignment should be applied, which must be a Resource ID (such as Subscription e.g. `/subscriptions/00000000-0000-0000-000000000000` or a Resource Group e.g. `/subscriptions/00000000-0000-0000-000000000000/resourceGroups/myResourceGroup`). Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_assignment\_types | List of the managed service identity type of this Policy assignment. Possible values are `SystemAssigned` (where Azure will generate a service principal for you), or None (no use of a managed service identity). | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_definition\_enabled | Boolean flag which describes whether or not to enable Policy definition. | `bool` | `false` | no |
| policy\_descriptions | List of descriptions which define the Policy definitions. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_display\_names | List of Policy definition display names. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_initiative\_definitions | The List which provides policy definitions for the policy set definition. This is a json object representing the bundled policy definitions . | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_initiative\_descriptions | A list which provides the decriptions for the policy initiatives. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_initiative\_display\_names | List of display names of the policy initiatives. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_initiative\_enabled | Boolean Flag which decribe whether or not enable the policy set definition. | `bool` | `false` | no |
| policy\_initiative\_management\_group\_ids | List of IDs of the management group where this policy should be defined. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_initiative\_metadatas | A list which describes the metadata for the policy initiatives. This is a json object representing additional metadata that should be stored with the policy definition. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_initiative\_names | List of name of the policy initiatives. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_initiative\_parameters | List of arameters for the policy initiatives. This field is a json object that allows you to parameterize your policy definition. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_initiative\_types | List of policy set types. Possible values are `BuiltIn` or `Custom`. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_management\_group\_ids | List of IDs of the management groups where this policy should be defined. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_metadatas | List of  metadatas for the Policy definition. This is a json object representing additional metadata that should be stored with the policy definition. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_modes | List of Policy modes that allows us to specify which resource types will be evaluated. The value can be `All`, `Indexed` or `NotSpecified`. Changing this resource forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_names | List of Policy definition names. Changing this force a new resourec to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_parameters | List of parameters for the Policy definition. This field is a json object that allows you to parameterize your policy definition. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_rules | List of policy rules for the Policy definition. This is a json object representing the rule that contains an if and a then block. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| policy\_types | List of Policy types. The value can be `BuiltIn`, `Custom` or `NotSpecified`. Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| identities | n/a |
| policy\_assignmnet\_ids | The IDs of the Policy assignmnets. |
| policy\_definition\_ids | The IDs of the Policy definition. |
| policy\_set\_definition\_ids | The IDs of the Policy set definitions. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
