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
  google_vars = read_terragrunt_config(find_in_parent_folders("google.hcl"))
}

inputs = merge(
    local.google_vars.locals,
)