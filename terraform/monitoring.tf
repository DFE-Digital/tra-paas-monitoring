
module "prometheus_all" {
  source = "git::https://github.com/DFE-Digital/cf-monitoring.git//prometheus_all?ref=add-docker-credential"

  monitoring_instance_name     = var.monitoring_instance_name
  monitoring_org_name          = local.paas_org_name
  monitoring_space_name        = var.paas_space
  paas_exporter_username       = local.secrets.PAAS_EXPORTER_USERNAME
  paas_exporter_password       = local.secrets.PAAS_EXPORTER_PASSWORD
  grafana_admin_password       = local.secrets.GRAFANA_ADMIN_PASSWORD
  external_exporters           = var.monitor_scrape_applications
  postgres_services            = var.monitor_scrape_backing_services
  grafana_google_client_id     = local.secrets.GRAFANA_GOOGLE_CLIENT_ID
  grafana_google_client_secret = local.secrets.GRAFANA_GOOGLE_CLIENT_SECRET
}
