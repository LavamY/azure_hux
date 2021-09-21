# Configure Terragrunt to automatically store tfstate files in an Azure container
remote_state {
    backend = "azurerm"
    config = {
        key = "${path_relative_to_include()}/terraform.tfstate"
        resource_group_name  = "<inherited_value>"
        storage_account_name = "<inherited_value>"
        container_name = "<inherited_value>"
    }
}