variable "azure_sp_credentials_json" {
  default = ""
}

variable "paas_sso_passcode" {
  default = ""
}
variable "monitoring_instance_name" {}
variable "alertmanager_app_config" {
  type = map(
    object({
      response_threshold = optional(number)
    })
  )
}
variable "alertable_redis_services" {}
variable "key_vault_name" {}
variable "key_vault_secret_name" {}
variable "resource_group_name" {}
variable "paas_space" {}
variable "monitor_scrape_applications" {
  default = []
}
variable "monitor_scrape_backing_services" {}
variable "redis_services" {}

locals {
  alert_rules_variables = {
    cfapps_dashboard_url      = "https://grafana-${var.monitoring_instance_name}.london.cloudapps.digital/d/eF19g4RZx/cf-apps?orgId=1&refresh=10s&var-SpaceName=${var.paas_space}"
    apps                      = var.alertmanager_app_config
    alertable_redis_instances = [for r in var.alertable_redis_services : split("/", r)[1]]
    monitoring_space_name     = var.paas_space
  }
  alert_rules = templatefile("./config/alert.rules.tmpl", local.alert_rules_variables)
}
