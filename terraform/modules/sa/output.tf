output "gke_node_pool_sa_email" {
  value = google_service_account.gke_node_pool.email
}

output "sql_proxy_sa_email" {
  value = google_service_account.sql_proxy.email
}
