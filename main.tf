
provider "azurerm" {
  features {}
  skip_provider_registration = "true"
}

locals {
  secrets = {
    key123 = {
      value = "the-very-secret-password"
    },
    auth-token = {
      value = "the-secret-token"
    }
  }
}

locals {
  vault-id = "/subscriptions/964df7ca-3ba4-48b6-a695-1ed9db5723f8/resourceGroups/1-45e433a8-playground-sandbox/providers/Microsoft.KeyVault/vaults/total-foo-bar-key-vault"
}

module "write-azure-key-vault-secrets" {

  source       = "../captain-k8s-iac-modules/write-azure-key-vault-secrets"
  secret       = local.secrets
  key_vault_id = local.vault-id

}




