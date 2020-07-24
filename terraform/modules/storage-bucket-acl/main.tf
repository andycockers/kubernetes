resource "google_storage_bucket_acl" "bucket-acl" {
  bucket = var.bucket_name
}