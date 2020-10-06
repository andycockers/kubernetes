terraform {
  backend "gcs" {
    bucket = "automation-statefiles"
    prefix = var.server_name
  }
}