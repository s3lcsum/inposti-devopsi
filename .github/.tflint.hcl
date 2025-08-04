# TFLint configuration for Terraform project
# See https://github.com/terraform-linters/tflint/blob/master/docs/user-guide/config.md

config {
  # Enable module inspection
  module = true
  
  # Disable color output in CI environments
  color = true
  
  # Enable specific rule sets
  disabled_by_default = false
}

# Terraform plugin
plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

# Google Cloud Platform plugin
plugin "google" {
  enabled = true
  version = "0.29.0"
  source  = "github.com/terraform-linters/tflint-ruleset-google"
}

# Rule customizations
rule "terraform_deprecated_interpolation" {
  enabled = true
}

rule "terraform_deprecated_index" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

rule "terraform_comment_syntax" {
  enabled = true
}

rule "terraform_documented_outputs" {
  enabled = true
}

rule "terraform_documented_variables" {
  enabled = true
}

rule "terraform_typed_variables" {
  enabled = true
}

rule "terraform_module_pinned_source" {
  enabled = true
  style   = "semver"
}

rule "terraform_naming_convention" {
  enabled = true
  format  = "snake_case"
}

rule "terraform_required_version" {
  enabled = true
}

rule "terraform_required_providers" {
  enabled = true
}

rule "terraform_standard_module_structure" {
  enabled = true
}

rule "terraform_workspace_remote" {
  enabled = true
}