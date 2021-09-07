remote_state {
  backend = "gcs"
  config = {
    bucket         = "automation-statefiles"
    key            = "${path_relative_to_include()}/terraform.tfstate"
  }
}