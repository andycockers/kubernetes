# Storage Bucket ACL Config

module "test_bucket_acl" {
  source      = "../modules/storage-bucket-acl"
  name        = var.test_bucket_acl
  bucket_name = module.test_bucket.bucket_name
  
}
