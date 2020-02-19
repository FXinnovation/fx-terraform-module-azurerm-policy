locals {
  should_create_policy_definition     = var.enabled && var.policy_definition_enabled
  should_create_policy_assignment     = var.enabled && var.policy_assignment_enabled
  should_create_policy_set_definition = var.enabled && var.policy_initiative_enabled

  policy_definition_rule_files_string = join(",", fileset(var.path_to_policy_definition_rules, "*"))
  policy_definition_rule_files        = split(",", local.policy_definition_rule_files_string)

  policy_definition_metadata_files_string = join(",", fileset(var.path_to_policy_definition_metadatas, "*"))
  policy_definition_metadata_files        = split(",", local.policy_definition_metadata_files_string)

  policy_definition_parameter_files_string = join(",", fileset(var.path_to_policy_definition_parameters, "*"))
  policy_definition_parameter_files        = split(",", local.policy_definition_parameter_files_string)

  policy_initiative_policy_definition_files_string = join(",", fileset(var.path_to_policy_initiative_policy_definitions, "*"))
  policy_initiative_policy_definition_files        = split(",", local.policy_initiative_policy_definition_files_string)

  policy_initiative_metadata_files_string  = join(",", fileset(var.path_to_policy_initiative_metadatas, "*"))
  policy_initiative_metadata_files         = split(",", local.policy_initiative_metadata_files_string)
  policy_initiative_parameter_files_string = join(",", fileset(var.path_to_policy_initiative_parameters, "*"))
  policy_initiative_parameter_files        = split(",", local.policy_initiative_parameter_files_string)

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
  metadata            = file("${var.path_to_policy_definition_metadatas}/${element(local.policy_definition_metadata_files, count.index)}")
  policy_rule         = file("${var.path_to_policy_definition_rules}/${element(local.policy_definition_rule_files, count.index)}")
  parameters          = file("${var.path_to_policy_definition_parameters}/${element(local.policy_definition_parameter_files, count.index)}")

  lifecycle {
    # Ignore metadata changes as Azure adds additional metadata module does not handle
    ignore_changes = [
      metadata,
    ]
  }
}

###
# Policy assignment
###

resource "azurerm_policy_assignment" "this_assignment" {
  count = local.should_create_policy_assignment ? length(var.policy_names) : 0

  name                 = var.policy_assignment_names_enabled ? "${element(var.policy_names, count.index)}-${count.index}" : element(var.policy_assignment_names, count.index)
  scope                = element(var.policy_assignment_scopes, count.index)
  policy_definition_id = element(var.policy_names, count.index) != null ? element(azurerm_policy_set_definition.this_definition.*.id, count.index) : var.policy_assignment_policy_definition_ids
  location             = element(var.policy_assignment_locations, count.index)
  description          = element(var.policy_assignment_descriptions, count.index)
  display_name         = element(var.policy_assignment_display_names, count.index)
  parameters           = element(var.policy_assignment_parameters, count.index)
  #not_scopes           = element(var.policy_assignment_not_scopes, count.index)

  dynamic "identity" {
    for_each = var.identities[count.index]

    content {
      type = identity.policy_assignment_types
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
  policy_definitions  = file("${var.path_to_policy_initiative_policy_definitions}/${element(local.policy_initiative_policy_definition_files, count.index)}")
  description         = element(var.policy_initiative_descriptions, count.index)
  management_group_id = element(var.policy_initiative_management_group_ids, count.index)
  metadata            = file("${var.path_to_policy_initiative_metadatas}/${element(local.policy_initiative_metadata_files, count.index)}")
  parameters          = file("${var.path_to_policy_initiative_parameters}/${element(local.policy_initiative_parameter_files, count.index)}")
}
