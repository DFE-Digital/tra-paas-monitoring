locals {
  paas_api_url  = "https://api.london.cloud.service.gov.uk"
  paas_org_name = "dfe"

  secrets = yamldecode(data.azurerm_key_vault_secret.secrets.value)
}
