terraform {
  backend "gcs" {
    bucket = "automation-statefiles"
    prefix = "${var.JOB_NAME}/state"
  }
}