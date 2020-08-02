module "crm_api" {
  source = "../modules/services"
  name                       = var.crm_name
  project_id                 = var.project_id
  api_name                   = var.crm_api_name
  disable_dependent_services = var.crm_disable_dependent_services
    }