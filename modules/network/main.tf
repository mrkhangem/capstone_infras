resource "google_compute_network" "private_network" {
  name = var.network_name
}

# resource "google_compute_subnetwork" "private_subnet1" {
#   name          = "${var.network_name}-subnet1"
#   ip_cidr_range = var.subnet1_cidr
#   network       = google_compute_network.private_network.id
# }

resource "google_compute_subnetwork" "private_subnet2" {
  name          = "${var.network_name}-subnet2"
  ip_cidr_range = var.subnet2_cidr
  network       = google_compute_network.private_network.id
}

resource "google_compute_router" "nat_router" {
  name    = "${var.network_name}-router"
  network = google_compute_network.private_network.id
}

resource "google_compute_router_nat" "nat_config" {
  name                       = "${var.network_name}-nat"
  router                     = google_compute_router.nat_router.name
  nat_ip_allocate_option     = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_subnetwork" "private_subnet1" {
  name          = "${var.network_name}-subnet1"
  ip_cidr_range = var.subnet1_cidr
  network       = google_compute_network.private_network.id

  secondary_ip_range {
    range_name    = "gke-pods"
    ip_cidr_range = "10.1.0.0/16"
  }

  secondary_ip_range {
    range_name    = "gke-services"
    ip_cidr_range = "10.2.0.0/20"
  }
}
