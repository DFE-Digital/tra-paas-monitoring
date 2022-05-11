terraform {
  required_version = "~> 1.0"
  experiments      = [module_variable_optional_attrs]
  backend "azurerm" {
    container_name = "dqtmonitoring-tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.90"
    }

    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "~> 0.15"
    }
  }
}
