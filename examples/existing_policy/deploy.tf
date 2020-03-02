data "azurerm_client_config" "current" {}

resource "random_string" "this" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "example" {
  name     = "tftest${random_string.this.result}"
  location = "West US"
}

module "existing" {
  source = "../.."

  policy_assignment_enabled       = true
  policy_assignment_names         = ["tf${random_string.this.result}"]
  policy_assignment_scopes        = ["/subscriptions/${var.subscription_id}"]
  existing_policy_definition_ids  = ["/providers/Microsoft.Authorization/policyDefinitions/0e60b895-3786-45da-8377-9c6b4b6ac5f9"]
  policy_assignment_locations     = ["westeurope"]
  policy_assignment_display_names = ["boo${random_string.this.result}"]
}
