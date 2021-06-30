resource "google_project_iam_member" "sql_client_sa_roles" {
  for_each = toset([
    "roles/cloudsql.client"
  ])
  role   = each.value
  member = "serviceAccount:${var.sql_client_sa_email}"
}
