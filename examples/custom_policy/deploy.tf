data "azurerm_client_config" "current" {}

locals {
  custom_policy_metadata_files_string   = "${path.root}/policies/metadata"
  custom_policy_rules_files_string      = "${path.root}/policies/policy_rules"
  custom_policy_parameters_files_string = "${path.root}/policies/parameters"
}


resource "random_string" "this" {
  length  = 6
  upper   = false
  special = false
}
module "custom" {
  source = "../.."

  policy_definition_enabled = true
  policy_names              = ["tftest${random_string.this.result}"]
  policy_types              = ["Custom"]
  policy_modes              = ["All"]
  policy_display_names      = ["terraform_test${random_string.this.result}"]

  path_to_policy_definition_rules      = "${local.custom_policy_rules_files_string}"
  path_to_policy_definition_metadatas  = "${local.custom_policy_metadata_files_string}"
  path_to_policy_definition_parameters = "${local.custom_policy_parameters_files_string}"

  policy_assignment_enabled    = true
  policy_assignment_scopes     = ["/SCOPE"]
  policy_assignment_not_scopes = []

}
