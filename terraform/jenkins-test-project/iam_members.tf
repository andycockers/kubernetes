## Project Viewer

module "test-project-viewer" {
  source          = "../modules/service-account-iam-member"
  name            = var.test-project-viewer
  project_id      = var.project_id
  iam_binding     = var.project_viewer
  member          = module.test-sa.email
}