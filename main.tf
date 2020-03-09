locals {
  should_create_policy_definition     = var.enabled && var.custom_policy_definition_enabled
  should_create_policy_assignment     = var.enabled && var.policy_assignment_enabled
  should_create_policy_set_definition = var.enabled && var.policy_initiative_enabled
}

###
# Policy definition
###

resource "azurerm_policy_definition" "this" {
  count = local.should_create_policy_definition ? length(var.custom_policy_names) : 0

  name                = element(var.custom_policy_names, count.index)
  policy_type         = element(var.custom_policy_types, count.index)
  mode                = element(var.custom_policy_modes, count.index)
  display_name        = element(var.custom_policy_display_names, count.index)
  description         = element(var.custom_policy_descriptions, count.index)
  management_group_id = element(var.custom_policy_management_group_ids, count.index)
  metadata            = lookup(element(var.custom_policies, count.index), "metadata", null)
  policy_rule         = lookup(element(var.custom_policies, count.index), "policy_rule", null)
  parameters          = lookup(element(var.custom_policies, count.index), "parameters", null)

  lifecycle {
    # Ignore metadata changes as Azure adds additional metadata module does not handle
    ignore_changes = [
      metadata,
    ]
  }
}

###
# Policy set definition
###

resource "azurerm_policy_set_definition" "this_definition" {
  count = local.should_create_policy_set_definition ? length(var.policy_initiative_names) : 0

  name                = element(var.policy_initiative_names, count.index)
  policy_type         = element(var.policy_initiative_types, count.index)
  display_name        = element(var.policy_initiative_display_names, count.index)
  policy_definitions  = lookup(element(var.policy_initiatives, count.index), "policy_definitions", null)
  description         = element(var.policy_initiative_descriptions, count.index)
  management_group_id = element(var.policy_initiative_management_group_ids, count.index)
  metadata            = lookup(element(var.policy_initiatives, count.index), "metadata", null)
  parameters          = lookup(element(var.policy_initiatives, count.index), "parameters", null)
}

###
# Policy assignment
###

resource "azurerm_policy_assignment" "this_assignment" {
  count = local.should_create_policy_assignment ? length(var.policy_assignment_names) : 0

  name                 = element(var.policy_assignment_names, count.index)
  scope                = lookup(element(var.policy_assignments, count.index), "scope", null)
  policy_definition_id = element(var.custom_policies, count.index) != null ? element(compact(concat(concat(azurerm_policy_definition.this.*.id, [""]), var.existing_policy_definition_ids)), count.index) : element(compact(concat(concat(azurerm_policy_set_definition.this_definition.*.id, [""]), var.existing_policy_definition_ids)), count.index)
  location             = element(var.policy_assignment_locations, count.index)
  description          = element(var.policy_assignment_descriptions, count.index)
  display_name         = element(var.policy_assignment_display_names, count.index)
  parameters           = lookup(element(var.policy_assignments, count.index), "parameters", null)
  not_scopes           = element(var.policy_assignment_not_scopes, count.index)

  identity {
    type = element(var.policy_assignment_identity_enabled, count.index) != false ? var.identity_type : "None"
  }
}
