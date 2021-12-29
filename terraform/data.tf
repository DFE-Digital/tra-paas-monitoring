data "azurerm_key_vault" "vault" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "secrets" {
  key_vault_id = data.azurerm_key_vault.vault.id
  name         = var.key_vault_secret_name
}

data "cloudfoundry_space" "space" {
  name     = var.paas_space
  org_name = local.paas_org_name
}

data "cloudfoundry_domain" "cloudapps" {
  name = "london.cloudapps.digital"
}

data "cloudfoundry_domain" "internal" {
  name = "apps.internal"
}
