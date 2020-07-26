terraform {
  backend "gcs" {
    bucket = "automation-statefiles"
    prefix = "test_bucket/states"
  }
}