terraform {
  backend "azurerm" {
    resource_group_name  = "remote-state"
    storage_account_name = "therealbestnamesa"
    container_name       = "ailz-platform"
    key                  = "platform.tfstate"
    use_oidc             = true
  }
}
