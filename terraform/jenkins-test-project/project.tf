data "google_billing_account" "acct" {
  billing_account            = var.billing_account
  open                       = true
}

# Project config
module "project" {
  source                     = "../modules/project"
  project_name               = var.project_name
  project_id                 = random_pet.random.id
  billing_account            = data.google_billing_account.acct.id
}