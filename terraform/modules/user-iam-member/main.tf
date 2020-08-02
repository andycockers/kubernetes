resource "google_project_iam_member" "member-iam" {
  role    = var.iam_binding
  member  = "user:${var.member}"
  project = var.project_id
}