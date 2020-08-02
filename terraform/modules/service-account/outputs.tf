output "sa_account_id" {
  value = google_service_account.sa.account_id
}

output "email" {
  value = google_service_account.sa.email
}
