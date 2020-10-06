terraform {
  backend "gcs" {
    bucket = "automation-statefiles"
    prefix = "hetzner_server"
  }
}