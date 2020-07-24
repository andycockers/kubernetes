terraform {
  backend "gcs" {
    bucket = "automation-statefiles"
    prefix = "kubernetes/states"
  }
}