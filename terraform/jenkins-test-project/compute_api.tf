module "compute_api" {
  source = "../modules/services"
  name                       = var.compute_name
  project_id                 = module.project.project_id
  api_name                   = var.compute_api_name
  disable_dependent_services = var.compute_disable_dependent_services
    }