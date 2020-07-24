# Storage Bucket ACL Config

module "automation-statefiles-acl" {
  source      = "../modules/storage-bucket-acl"
  name        = var.automation-statefiles-acl
  bucket_name = module.automation-statefiles.bucket_name
  
}
