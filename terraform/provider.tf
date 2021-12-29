locals {
  azure_credentials = try(jsondecode(var.azure_sp_credentials_json), null)
}

provider "azurerm" {
  subscription_id            = try(local.azure_credentials.subscriptionId, null)
  client_id                  = try(local.azure_credentials.clientId, null)
  client_secret              = try(local.azure_credentials.clientSecret, null)
  tenant_id                  = try(local.azure_credentials.tenantId, null)
  skip_provider_registration = true

  features {}
}

provider "cloudfoundry" {
  api_url           = local.paas_api_url
  user              = var.paas_sso_passcode == "" ? local.secrets.PAAS_USERNAME : null
  password          = var.paas_sso_passcode == "" ? local.secrets.PAAS_PASSWORD : null
  sso_passcode      = var.paas_sso_passcode != "" ? var.paas_sso_passcode : null
  store_tokens_path = var.paas_sso_passcode != "" ? ".cftoken" : null
}
