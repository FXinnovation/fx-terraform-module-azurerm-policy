###
# General
###

variable "enabled" {
  description = "Enable or disable modul"
  default     = true
}

###
# Policy definition
###

variable "custom_policy_definition_enabled" {
  description = "Boolean flag which describes whether or not to enable Policy definition."
  default     = false
}

variable "custom_policy_names" {
  description = "List of Policy definition names. Changing this force a new resourec to be created. "
  type        = list(string)
  default     = [""]
}

variable "custom_policy_types" {
  description = "List of Policy types. The value can be `BuiltIn`, `Custom` or `NotSpecified`. Changing this forces a new resource to be created. "
  type        = list(string)
  default     = [""]
}

variable "custom_policy_modes" {
  description = "List of Policy modes that allows us to specify which resource types will be evaluated. The value can be `All`, `Indexed` or `NotSpecified`. Changing this resource forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "custom_policy_display_names" {
  description = "List of Policy definition display names."
  type        = list(string)
  default     = [""]
}

variable "custom_policy_descriptions" {
  description = "List of descriptions which define the Policy definitions."
  type        = list(string)
  default     = [""]
}

variable "custom_policy_management_group_ids" {
  description = "List of IDs of the management groups where this policy should be defined. Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "custom_policies" {
  description = "One or more custom policies."
  type = list(object({
    metadata    = string
    policy_rule = string
    parameters  = string
  }))
  default = [null]
}

###
# Policy assignment
###

variable "policy_assignment_enabled" {
  description = "Boolean flag which describes whether or not to enable the Policy assignment."
  default     = false
}

variable "policy_assignment_names" {
  description = "A list of Policy assignment names.Changing this forces a new resource to be created. "
  type        = list(string)
  default     = [""]
}

variable "policy_assignments" {
  description = "List scopes and parameters at which the Policy Assignment should be applied, which must be a Resource ID (such as Subscription e.g. `/subscriptions/00000000-0000-0000-000000000000` or a Resource Group e.g. `/subscriptions/00000000-0000-0000-000000000000/resourceGroups/myResourceGroup`). Changing this forces a new resource to be created."
  type        = list(object({ scope = string, parameters = string }))
  default     = [null]
}

variable "existing_policy_definition_ids" {
  description = "List of  IDs of the Policy Definition to be applied at the specified Scope"
  type        = list(string)
  default     = [""]
}

variable "policy_assignment_parameters_enabled" {
  description = "List of boolean flags which describes the policy assignments has parameters or not."
  type        = list(bool)
  default     = [false]
}

variable "policy_assignment_locations" {
  description = "List of Azure locations where this policy assignment should exist. This is required when an Identity is assigned. Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "policy_assignment_descriptions" {
  description = "List of descriptions to use for the  Policy assignments. Changing this force a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "policy_assignment_display_names" {
  description = "List of display names to use for this Policy Assignment. Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "policy_assignment_parameters" {
  description = "This is a JSON object that maps to the Parameters field from the Policy Definition. Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "policy_assignment_not_scopes" {
  description = "A list of the Policy assignment's excluded scopes. The list must contain resource IDs (such as subscriptions e.g. `/subscriptions/00000000-0000-0000-000000000000` or resource groups e.g. `/subscriptions/00000000-0000-0000-000000000000/resourceGroups/myResourceGroup`)."
  type        = list(list(string))
  default     = [[]]
}

variable "policy_assignment_identity_enabled" {
  description = "Boolean lag which describes whether to enable the identity block or not."
  type        = list(bool)
  default     = [false]
}

variable "identity_type" {
  description = "One or more identity blocks. Possible values for the policy assignment types are `SystemAssigned` (where Azure will generate a service principal for you), or None (no use of a managed service identity)."
  type        = string
  default     = "SystemAssigned"
}

###
# Policy set definition
###

variable "policy_initiative_enabled" {
  description = "Boolean Flag which decribe whether or not enable the policy set definition."
  default     = false
}

variable "policy_initiative_names" {
  description = "List of name of the policy initiatives. Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "policy_initiative_types" {
  description = "List of policy set types. Possible values are `BuiltIn` or `Custom`. Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "policy_initiative_display_names" {
  description = "List of display names of the policy initiatives."
  type        = list(string)
  default     = [""]
}

variable "policy_initiative_descriptions" {
  description = "A list which provides the decriptions for the policy initiatives."
  type        = list(string)
  default     = [""]
}

variable "policy_initiatives" {
  description = "One or more policy initiatives."
  type = list(object({
    policy_definitons = string
    metadata          = string
    parameters        = string
  }))
  default = null
}

variable "policy_initiative_management_group_ids" {
  description = "List of IDs of the management group where this policy should be defined. Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}
