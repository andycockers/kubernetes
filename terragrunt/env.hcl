locals {
  terraform_state_bucket_name         = "${local.environment_prefix}-terraform-states"
  terraform_state_dynamodb_table_name = "${local.environment_prefix}-tf-state-lock"
  terraform_state_region_name         = "us-west-2"}
