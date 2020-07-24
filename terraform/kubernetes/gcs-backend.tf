terraform {
  backend "gcs" {
    bucket = "terraform-1-1000-state-files"
    prefix = "4cnextgen/4cng"
    credentials = ""
  }
}