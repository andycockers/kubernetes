# In order to link the billing account, the billing account api needs to be enabled
# in the project where the service account was created.

resource "google_project" "project" {
  name       = var.project_name
  project_id = var.project_id
  billing_account = var.billing_account
}