locals {
  # Load common-level variables
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))

  # Load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Automatically load region-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  # Extract the variables we need for easy access
  aws_account_name                    = local.environment_vars.locals.aws_account_name
  aws_region                          = local.region_vars.locals.aws_region
  environment_prefix                  = local.environment_vars.locals.environment_prefix
  terraform_state_bucket_name         = local.environment_vars.locals.terraform_state_bucket_name
  terraform_state_region_name         = local.environment_vars.locals.terraform_state_region_name
  terraform_state_dynamodb_table_name = local.environment_vars.locals.terraform_state_dynamodb_table_name

  additional_inputs = {
    prefix = "${local.environment_vars.locals.environment_prefix}-${local.region_vars.locals.region_network_override}"
  }
}

remote_state {
  backend = "s3"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    profile        = local.environment_prefix
    bucket         = local.terraform_state_bucket_name
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.terraform_state_region_name
    encrypt        = true
    dynamodb_table = local.terraform_state_dynamodb_table_name
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_version = "0.14.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.25.0"
    }

    template = {
      source  = "hashicorp/template"
      version = "~> 2.2.0"
    }
  }
}

provider "aws" {
  region = "${local.aws_region}"
  profile = "${local.aws_account_name}"
}
EOF
}

terragrunt_version_constraint = "0.27.2"

inputs = merge(
local.common_vars.locals,
local.environment_vars.locals,
local.region_vars.locals,
local.additional_inputs,
)
