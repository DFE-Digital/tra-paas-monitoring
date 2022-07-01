variable "azure_sp_credentials_json" {
  default = ""
}

variable "paas_sso_passcode" {
  default = ""
}
variable "monitoring_instance_name" {}
variable "key_vault_name" {}
variable "key_vault_secret_name" {}
variable "resource_group_name" {}
variable "paas_space" {}
variable "monitor_scrape_applications" {
  default = []
}
variable "monitor_scrape_backing_services" {}
variable "redis_services" {}
variable "alertable_postgres_services" {
  default = {}
}
variable "postgres_dashboard_url" { default = "" }
variable "alertable_apps" {
  default = {}
}
variable "apps_dashboard_url" { default = "" }

locals {
  grafana_dashboard_files   = fileset(path.module, "dashboards/*")
  grafana_dashboard_strings = [for f in local.grafana_dashboard_files : file(f)]
}
