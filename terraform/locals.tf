locals {
  paas_api_url  = "https://api.london.cloud.service.gov.uk"
  paas_org_name = "dfe"

  secrets = yamldecode(data.azurerm_key_vault_secret.secrets.value)
  docker_credentials = {
    username = var.docker_username
    password = var.docker_password
  }
}
