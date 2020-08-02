terraform {
  backend "gcs" {
    bucket = "automation-statefiles"
    prefix = "crm-api/state"
  }
}