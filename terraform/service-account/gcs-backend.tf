terraform {
  backend "gcs" {
    bucket = "automation-statefiles"
    prefix = "${JOB_NAME}/state"
  }
}