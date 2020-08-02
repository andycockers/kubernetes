terraform {
  backend "gcs" {
    bucket = "automation-statefiles"
    prefix = "service-acount/state"
  }
}