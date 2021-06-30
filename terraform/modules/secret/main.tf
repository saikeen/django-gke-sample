resource "google_secret_manager_secret" "sql_client_sa_secret" {
  secret_id = "sql-client-key"

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "sql_client_secret_version" {
  secret = google_secret_manager_secret.sql_client_sa_secret.id

  secret_data = base64decode(var.sql_client_sa_private_key)
}
