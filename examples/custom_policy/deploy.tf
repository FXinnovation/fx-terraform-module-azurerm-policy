data "azurerm_client_config" "current" {}

locals {
  custom_policy_metadata_files_string   = fileset("./policies/metadata", "*")
  custom_policy_rules_files_string      = fileset("./policies/policy_rules", "*")
  custom_policy_parameters_files_string = fileset("./policies/parameters", "*")
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

  policy_rules      = [for f in local.custom_policy_rules_files_string : file("./policies/policy_rules/${f}")]
  policy_parameters = [for f in local.custom_policy_parameters_files_string : file("./policies/parameters/${f}")]
  policy_metadatas  = [for f in local.custom_policy_metadata_files_string : file("./policies/metadata/${f}")]

  policy_assignment_enabled    = true
  policy_assignment_scopes     = ["/SCOPE"]
  policy_assignment_not_scopes = []

}
