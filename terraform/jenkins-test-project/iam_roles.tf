# IAM Roles

## Pub sub admin
variable "pub_sub_iam_admin"        { default = "roles/pubsub.admin" }
## Secret Manager accessor
variable "secretmanager_iam_access" { default = "roles/secretmanager.secretAccessor" }
## Storage Object Admin
variable "storage_object_admin"     {default = "roles/storage.objectAdmin"}
## Project Viewer
variable "project_viewer"           {default = "roles/viewer"}

