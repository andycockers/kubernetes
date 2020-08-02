terraform {
  backend "gcs" {
    bucket = "automation-statefiles"
    prefix = "jenkins-test-project/state"
  }
}