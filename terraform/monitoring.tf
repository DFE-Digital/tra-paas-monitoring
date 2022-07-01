
module "prometheus_all" {
  source = "git::https://github.com/DFE-Digital/cf-monitoring.git//prometheus_all"

  monitoring_instance_name = var.monitoring_instance_name
  monitoring_org_name      = local.paas_org_name
  monitoring_space_name    = var.paas_space
  paas_exporter_username   = local.secrets.PAAS_EXPORTER_USERNAME
  paas_exporter_password   = local.secrets.PAAS_EXPORTER_PASSWORD

  grafana_admin_password       = local.secrets.GRAFANA_ADMIN_PASSWORD
  grafana_google_client_id     = local.secrets.GRAFANA_GOOGLE_CLIENT_ID
  grafana_google_client_secret = local.secrets.GRAFANA_GOOGLE_CLIENT_SECRET
  grafana_json_dashboards      = local.grafana_dashboard_strings

  alertmanager_slack_url = local.secrets.SLACK_WEBHOOK

  internal_apps               = var.monitor_scrape_applications
  postgres_services           = var.monitor_scrape_backing_services
  redis_services              = var.redis_services
  alertable_postgres_services = var.alertable_postgres_services
  postgres_dashboard_url      = var.postgres_dashboard_url

  alertable_apps     = var.alertable_apps
  apps_dashboard_url = var.apps_dashboard_url

  enable_prometheus_yearly = true
}
