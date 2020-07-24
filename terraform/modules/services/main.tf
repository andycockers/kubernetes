resource "google_project_service" "service" {
  project = var.project_id
  service = var.api_name
  disable_dependent_services = var.disable_dependent_services
}