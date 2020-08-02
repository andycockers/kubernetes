# Test Account

module "test-sa" {
  source          = "../modules/service-account"
  name            = var.test-sa
  project_id      = var.project_id
  sa_account_id   = var.test-sa
  sa_display_name = var.sa_display_name_test_sa
}