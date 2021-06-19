output "vpc_id" {
  value = google_compute_network.custom.id
}
output "subnet_id" {
  value = google_compute_subnetwork.custom.id
}
output "subnet_range_name" {
  value = google_compute_subnetwork.custom.secondary_ip_range.1.range_name
}