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

module "custom" {
  source = "../.."

  custom_policy_definition_enabled = true
  custom_policy_names              = ["tftest1${random_string.this.result}", "tftest2${random_string.this.result}"]
  custom_policy_types              = ["Custom"]
  custom_policy_modes              = ["All"]
  custom_policy_display_names      = ["terraform_test${random_string.this.result}", "terraform_test2${random_string.this.result}"]

  custom_policies = [
    {
      metadata = <<METADATA
            {
              "category": "General",
              "updatedBy": null,
              "updatedOn": null
            }
          METADATA

      policy_rule = <<POLICY_RULE
            {
              "if": {
                  "allOf": [{
                           "field": "type",
                           "equals": "Microsoft.Sql/servers/databases"
                      },
                      {
                          "field": "name",
                          "notEquals": "master"
                      }
                  ]
              },
              "then": {
                  "effect": "[parameters('effect')]",
                  "details": {
                      "type": "Microsoft.Sql/servers/databases/transparentDataEncryption",
                      "name": "current",
                      "existenceCondition": {
                          "allOf": [{
                              "field": "Microsoft.Sql/transparentDataEncryption.status",
                              "equals": "enabled"
                           }]
                        }
                    }
                }
              }
          POLICY_RULE

      parameters = <<PARAMETERS
            {
              "effect": {
                  "type": "String",
                  "metadata": {
                      "displayName": "Effect",
                      "description": "Enable or disable the execution of the policy"
                  },
                  "allowedValues": [
                      "AuditIfNotExists",
                      "Disabled"
                  ],
                  "defaultValue": "AuditIfNotExists"
                }
              }
          PARAMETERS
    },
    {
      metadata = <<METADATA
            {
              "category": "General",
              "updatedBy": null,
              "updatedOn": null
            }
          METADATA

      policy_rule = <<POLICY_RULE
            {
              "if": {
                "allOf": [{
                        "field": "type",
                        "equals": "Microsoft.Resources/subscriptions/resourceGroups"
                        },
                        {
                          "anyOf": [{
                                  "not": {"field": "tags.FXOwner","like": "*"}},
                                  {"not": {"field": "tags.FXProject","match": "...."}},
                                  {"not": {"field": "tags.FXDepartment","like": "*"}},
                                  {"field": "tags.FXOwner","match": ""},
                                  {"field": "tags.FXDepartment","match": ""}]}
                  ]},"then": {"effect": "[parameters('effect')]"}
            }

          POLICY_RULE


      parameters = <<PARAMETERS
            {"effect": {"type": "String","metadata": {"displayName": "Effect","description": "Enable or disable the execution of the policy"},
            "allowedValues": ["Audit","Deny","Disabled"],"defaultValue": "Audit"}}
          PARAMETERS
    },

  ]

  policy_assignment_enabled = true
  policy_assignment_names   = ["tftest${random_string.this.result}"]
  policy_assignments = [
    {
      scope      = "/subscriptions/${var.subscription_id}"
      parameters = <<PARAMETERS
      PARAMETERS
    }
  ]
}
