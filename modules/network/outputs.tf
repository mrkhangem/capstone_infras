output "network_id" {
  value = google_compute_network.private_network.id
}

output "subnet1_id" {
  value = google_compute_subnetwork.private_subnet1.id
}

output "subnet2_id" {
  value = google_compute_subnetwork.private_subnet2.id
}
