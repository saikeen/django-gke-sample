resource "google_project_iam_member" "gke_node_pool_roles" {
  for_each = toset([
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/monitoring.viewer"
  ])
  role   = each.value
  member = "serviceAccount:${var.gke_node_pool_sa_email}"
}

resource "google_project_iam_member" "sql_proxy_roles" {
  for_each = toset([
    "roles/cloudsql.client"
  ])
  role   = each.value
  member = "serviceAccount:${var.sql_proxy_sa_email}"
}
