data "azurerm_client_config" "current" {}

resource "random_string" "this" {
  length  = 6
  upper   = false
  special = false
}
module "existing" {
  source = "../.."

  policy_names                     = ["tf${random_string.this.result}"]
  policy_assignmnet_scope          = ["/SCOPE"]
  policy_assignment_definition_ids = ["/providers/Microsoft.Authorization/policyDefinitions/0e60b895-3786-45da-8377-9c6b4b6ac5f9"]
  policy_assignmnet_location       = ["westeurope"]
  policy_display_name              = ["${random_string.this}"]
  policy_assignmnet_not_scopes     = []
  policy_assignmnets_parameters    = []
}
