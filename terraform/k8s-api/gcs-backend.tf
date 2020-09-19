terraform {
  backend "gcs" {
    bucket = "automation-statefiles"
    prefix = "k8s-api/state"
  }
}