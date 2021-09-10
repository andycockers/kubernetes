remote_state {
  backend = "gcs"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket = "automation-statefiles"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
  }
}

locals {
  project_id = "norse-acrobat-203806"
  zone       = "europe-west2-b"
  region     = "europe-west2"
  network    = "default"
  }

inputs = {
    project_id = local.project_id
    zone       = local.zone
    region     = local.region
    network    = local.network
    }