
# resource "google_container_cluster" "gke_cluster" {
#   name               = var.cluster_name
#   location           = var.region
#   network            = var.network_id
#   subnetwork         = var.subnet1_id
#   remove_default_node_pool = true

#   ip_allocation_policy {
#     cluster_secondary_range_name  = "gke-pods"
#     services_secondary_range_name = "gke-services"
#   }
# }


# resource "google_container_node_pool" "node_pool" {
#   name       = "node-pool"
#   cluster    = google_container_cluster.gke_cluster.name
#   location   = google_container_cluster.gke_cluster.location
#   node_count = var.node_count

#   node_config {
#     machine_type = "e2-standard-8"
#     oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
#     disk_size_gb = 100
#     metadata = {
#       disable-legacy-endpoints = "true"
#     }
#   }
# }

resource "google_container_cluster" "gke_cluster" {
  name                  = var.cluster_name
  location              = var.region
  network               = var.network_id
  subnetwork            = var.subnet1_id
  remove_default_node_pool = true
  initial_node_count    = 1  # Cần phải > 0 nếu không có node pool ban đầu.

  ip_allocation_policy {
    cluster_secondary_range_name  = "gke-pods"
    services_secondary_range_name = "gke-services"
  }
  node_config {
  machine_type = var.machine_type
  oauth_scopes = [ "https://www.googleapis.com/auth/cloud-platform" ]
  metadata = {
    disable-legacy-endpoints = "true"
  }
  disk_size_gb = var.disk_size_gb
    disk_type = var.disk_type
}
}

resource "google_container_node_pool" "node_pool" {
  name       = "node-pool"
  cluster    = google_container_cluster.gke_cluster.name
  location   = google_container_cluster.gke_cluster.location
  node_count = var.node_count


 node_config {
  machine_type = var.machine_type
  oauth_scopes = [ "https://www.googleapis.com/auth/cloud-platform" ]
  metadata = {
    disable-legacy-endpoints = "true"
  }
  disk_size_gb = var.disk_size_gb
    disk_type = var.disk_type
}


}
