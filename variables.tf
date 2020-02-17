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

variable "policy_definition_enabled" {
  description = "Boolean flag which describes whether or not to enable Policy definition."
  default     = false
}

variable "policy_names" {
  description = "List of Policy definition names. Changing this force a new resourec to be created. "
  type        = list(string)
  default     = [""]
}

variable "policy_types" {
  description = "List of Policy types. The value can be `BuiltIn`, `Custom` or `NotSpecified`. Changing this forces a new resource to be created. "
  type        = list(string)
  default     = [""]
}

variable "policy_modes" {
  description = "List of Policy modes that allows us to specify which resource types will be evaluated. The value can be `All`, `Indexed` or `NotSpecified`. Changing this resource forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "policy_display_names" {
  description = "List of Policy definition display names."
  type        = list(string)
  default     = [""]
}

variable "policy_descriptions" {
  description = "List of descriptions which define the Policy definitions."
  type        = list(string)
  default     = [""]
}

variable "policy_management_group_ids" {
  description = "List of IDs of the management groups where this policy should be defined. Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "policy_rules" {
  description = "List of policy rules for the Policy definition. This is a json object representing the rule that contains an if and a then block."
  type        = list(string)
  default     = [""]
}

variable "policy_parameters" {
  description = "List of parameters for the Policy definition. This field is a json object that allows you to parameterize your policy definition."
  type        = list(string)
  default     = [""]
}

variable "policy_metadatas" {
  description = "List of  metadatas for the Policy definition. This is a json object representing additional metadata that should be stored with the policy definition."
  type        = list(string)
  default     = [""]
}

###
# Policy assignment
###

variable "policy_assignment_enabled" {
  description = "Boolean flag which describes whether or not to enable the policy assignment."
  default     = false
}

variable "policy_assignment_names" {
  description = "List of names of the Policy Assignment. Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "policy_assignment_scopes" {
  description = "List of scopes at which the Policy Assignment should be applied, which must be a Resource ID (such as Subscription e.g. `/subscriptions/00000000-0000-0000-000000000000` or a Resource Group e.g. `/subscriptions/00000000-0000-0000-000000000000/resourceGroups/myResourceGroup`). Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "policy_assignment_definition_ids" {
  description = "List of  IDs of the Policy Definition to be applied at the specified Scope"
  type        = list(string)
  default     = [""]
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
  description = "List of parameters for the policy definition. This field is a JSON object that maps to the Parameters field from the Policy Definition. Changing this forces a new resource to be created."
  type        = list(string)
  default     = [""]
}

variable "policy_assignment_not_scopes" {
  description = "    A list of the Policy assignment's excluded scopes. The list must contain resource IDs (such as subscriptions e.g. `/subscriptions/00000000-0000-0000-000000000000` or resource groups e.g. `/subscriptions/00000000-0000-0000-000000000000/resourceGroups/myResourceGroup`)."
  type        = list(string)
  default     = [""]
}

variable "identities" {
  description = "One or more identity blocks."
  type        = list
  default     = []
}

variable "policy_assignment_types" {
  description = "List of the managed service identity type of this Policy assignment. Possible values are `SystemAssigned` (where Azure will generate a service principal for you), or None (no use of a managed service identity)."
  type        = list(string)
  default     = [""]
}

###
# Policy set definition
###

variable "policy_initiative_enabled" {
  description = "Boolean Flag which decribe whether or not enable the policy set definition."
  default     = false
}

variable "policy_initiative_names" {
  description = ""
  type        = list(string)
  default     = [""]
}

variable "policy_initiative_types" {
  description = ""
  type        = list(string)
  default     = [""]
}

variable "policy_initiative_display_names" {
  description = ""
  type        = list(string)
  default     = [""]
}

variable "policy_initiative_definitions" {
  description = ""
  type        = list(string)
  default     = [""]
}

variable "policy_initiative_descriptions" {
  description = ""
  type        = list(string)
  default     = [""]
}

variable "policy_initiative_management_group_ids" {
  description = ""
  type        = list(string)
  default     = [""]
}

variable "policy_initiative_metadatas" {
  description = ""
  type        = list(string)
  default     = [""]
}

variable "policy_initiative_parameters" {
  description = ""
  type        = list(string)
  default     = [""]
}
