locals {
  should_create_policy_definition     = var.enabled && var.policy_definition_enabled
  should_create_policy_assignment     = var.enabled && var.policy_assignment_enabled
  should_create_policy_set_definition = var.enabled && var.policy_initiative_enabled
}


###
# Policy definition
###

resource "azurerm_policy_definition" "this" {
  count = local.should_create_policy_definition ? length(var.policy_names) : 0

  name                = var.policy_names[count.index]
  policy_type         = var.policy_types[count.index]
  mode                = var.policy_modes[count.index]
  display_name        = var.policy_display_names[count.index]
  description         = var.policy_descriptions[count.index]
  management_group_id = var.policy_management_group_ids[count.index]
  metadata            = var.policy_metadatas[count.index]
  policy_rule         = var.policy_rules[count.index]
  parameters          = var.policy_parameters[count.index]

  lifecycle {
    # Ignore metadata changes as Azure adds additional metadata module does not handle
    ignore_changes = [
      "metadata",
    ]
  }
}

###
# Policy assignment
###

resource "azurerm_policy_assignment" "this_assignment" {
  count = local.should_create_policy_assignment ? length(var.policy_assignment_names) : 0

  name                 = "${var.policy_names}-${count.index}"
  scope                = var.policy_assignment_scopes[count.index]
  policy_definition_id = var.policy_definition_enabled ? element(azurerm_policy_set_definition.this_definition.*.id, count.index) : var.policy_assignment_definition_ids
  location             = var.policy_assignment_locations[count.index]
  description          = var.policy_assignment_descriptions[count.index]
  display_name         = var.policy_assignment_display_names[count.index]
  parameters           = var.policy_assignment_parameters[count.index]
  not_scopes           = [element(var.policy_assignment_not_scopes, count.index)]

  dynamic "identity" {
    for_each = var.identities[count.index]

    content {
      type = var.policy_assignment_types
    }
  }
}

###
# Policy set definition
###

resource "azurerm_policy_set_definition" "this_definition" {
  count = local.should_create_policy_set_definition ? length(var.policy_initiative_names) : 0

  name                = var.policy_initiative_names[count.index]
  policy_type         = var.policy_initiative_types[count.index]
  display_name        = var.policy_initiative_display_names[count.index]
  policy_definitions  = var.policy_initiative_definitions[count.index]
  description         = var.policy_initiative_descriptions[count.index]
  management_group_id = var.policy_initiative_management_group_ids[count.index]
  metadata            = var.policy_initiative_metadatas[count.index]
  parameters          = var.policy_initiative_parameters[count.index]
}
