# Storage Bucket Config

module "automation-statefiles" {
  source      = "../modules/storage-bucket"
  name        = var.automation-statefiles
  bucket_name = var.automation-statefiles
  project_id  = var.project_id
  location    = var.region
  
}
