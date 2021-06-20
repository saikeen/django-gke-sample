resource "google_secret_manager_secret" "sql_proxy_secret" {
  secret_id = "sql-proxy-key"

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "sql_proxy_secret_version" {
  secret = google_secret_manager_secret.sql_proxy_secret.id

  secret_data = base64decode(var.sql_proxy_sa_private_key)
}
