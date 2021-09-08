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