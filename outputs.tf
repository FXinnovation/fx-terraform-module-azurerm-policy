###
# Policy definition
###

output "policy_definition_ids" {
  description = "The IDs of the Policy definition. "
  value       = compact(concat(azurerm_policy_definition.this.*.id, [""]))
}

###
# Policy initiative
###

output "policy_set_definition_ids" {
  description = "The IDs of the Policy set definitions."
  value       = compact(concat(azurerm_policy_set_definition.this_definition.*.id, [""]))
}

###
# Policy assignmnet
###
output "policy_assignment_ids" {
  description = "The IDs of the Policy assignments."
  value       = compact(concat(azurerm_policy_assignment.this_assignment.*.id, [""]))
}

output "identities" {
  value = azurerm_policy_assignment.this_assignment.*.identity
}
