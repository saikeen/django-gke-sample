locals {
  env_resource_prefix = "${var.app_name}-${var.env}"
}

resource "google_container_cluster" "primary" {
  name     = "${local.env_resource_prefix}-cluster"
  location = var.location
  initial_node_count = 4
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
