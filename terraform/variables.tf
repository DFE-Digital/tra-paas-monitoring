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

# variable "docker_username" {}

# variable "docker_password" {}
