locals {
  env_resource_prefix = "${var.app_name}-${var.env}"
}

resource "google_compute_subnetwork" "custom" {
  name          = "${local.env_resource_prefix}-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.custom.id
  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "192.168.1.0/24"
  }

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = "192.168.64.0/22"
  }
}

resource "google_compute_network" "custom" {
  name                    = "${local.env_resource_prefix}-vpc"
  auto_create_subnetworks = false
}
