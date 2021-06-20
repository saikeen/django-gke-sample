resource "google_service_account" "gke_node_pool" {
  account_id   = "gke-node-pool"
  display_name = "gke-node-pool"
}

resource "google_service_account" "sql_proxy" {
  account_id   = "sql-proxy"
  display_name = "sql-proxy"
}

resource "google_service_account_key" "sql_proxy" {
  service_account_id = google_service_account.sql_proxy.name
}
