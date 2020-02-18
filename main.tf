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

  name                = element(var.policy_names, count.index)
  policy_type         = element(var.policy_types, count.index)
  mode                = element(var.policy_modes, count.index)
  display_name        = element(var.policy_display_names, count.index)
  description         = element(var.policy_descriptions, count.index)
  management_group_id = element(var.policy_management_group_ids, count.index)
  metadata            = element(var.policy_metadatas, count.index)
  policy_rule         = element(var.policy_rules, count.index)
  parameters          = element(var.policy_parameters, count.index)

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
  count = local.should_create_policy_assignment ? length(var.policy_names) : 0

  name                 = "${var.policy_names}-${count.index}"
  scope                = element(var.policy_assignment_scopes, count.index)
  policy_definition_id = element(var.policy_names, count.index) != null ? element(azurerm_policy_set_definition.this_definition.*.id, count.index) : var.policy_assignment_policy_definition_ids
  location             = element(var.policy_assignment_locations, count.index)
  description          = element(var.policy_assignment_descriptions, count.index)
  display_name         = element(var.policy_assignment_display_names, count.index)
  parameters           = element(var.policy_assignment_parameters, count.index)
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

  name                = element(var.policy_initiative_names, count.index)
  policy_type         = element(var.policy_initiative_types, count.index)
  display_name        = element(var.policy_initiative_display_names, count.index)
  policy_definitions  = element(var.policy_initiative_definitions, count.index)
  description         = element(var.policy_initiative_descriptions, count.index)
  management_group_id = element(var.policy_initiative_management_group_ids, count.index)
  metadata            = element(var.policy_initiative_metadatas, count.index)
  parameters          = element(var.policy_initiative_parameters, count.index)
}
