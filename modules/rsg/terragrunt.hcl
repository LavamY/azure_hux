# include {
#   # Include all settings from the root terragrunt.hcl file
#   path = find_in_parent_folders("terragrunt_root.hcl")
# }

include {
    path = find_in_parent_folders()
}

terraform {
  # Import networking module
  #  source = "git@github.com:LavamY/azure_disney.git//modules/resource_group/"
   source = "git::https://github.com/LavamY/infrastructure-module.git//app"
}

inputs = {
  location                         = "East US"
  resource_group_name              = "lavamrsg1"
}