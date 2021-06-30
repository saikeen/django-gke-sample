output "sql_client_sa_email" {
  value = google_service_account.sql_client.email
}

output "sql_client_sa_private_key" {
  value = google_service_account_key.sql_client.private_key
}
