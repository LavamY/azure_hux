
# include {
#   # Include all settings from the root terragrunt.hcl file
#   path = find_in_parent_folders("terragrunt_root.hcl")
# }
terraform {
  # Import networking module
  #  source = "git@github.com:LavamY/azure_disney.git//modules/resource_group/"
   source = "/home/HUX1/modules/rsg"
}
locals {
  # Load the data from common.hcl
  common = read_terragrunt_config(find_in_parent_folders("common.hcl"))

  # Load environment-level variables
  #environment_vars = read_terragrunt_config("env.hcl")

  # Automatically load account-level variables
  #project_vars = read_terragrunt_config("project.hcl")

  #env = local.environment_vars.locals.environment
  #project_id = local.project_vars.locals.project_id
}

# Generate an Azure ; provider block
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  features {}
}
terraform {
  backend "azurerm" {}
}
EOF
}

# Setting up Azure remote state backend.
remote_state {
  backend    = "azurerm"

  config = {
    key = "${path_relative_to_include()}/terraform.tfstate"
    resource_group_name  = "lavamrsg"
    storage_account_name = "lavamsa"
    container_name = "azuredisney"
  }
}