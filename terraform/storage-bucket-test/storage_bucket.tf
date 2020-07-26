# Storage Bucket Config

module "test_bucket" {
  source      = "../modules/storage-bucket"
  name        = var.test_bucket
  bucket_name = var.test_bucket
  project_id  = var.project_id
  location    = var.region
  
}

output "storage-bucket-name" {
  value = module.test_bucket
}
