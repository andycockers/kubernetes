## Project Viewer

module "test-project-viewer" {
  source          = "../modules/user-iam-member"
  name            = var.test-project-viewer
  project_id      = module.project.project_id
  iam_binding     = var.project_viewer
  member          = var.test
}