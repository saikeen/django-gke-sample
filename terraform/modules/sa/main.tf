resource "google_service_account" "sql_client" {
  account_id   = "sql-client"
  display_name = "sql-client"
}

resource "google_service_account_key" "sql_client" {
  service_account_id = google_service_account.sql_client.name
}
