terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}
provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source       = "./modules/network"
  network_name = var.network_name
  subnet1_cidr = var.subnet1_cidr
  subnet2_cidr = var.subnet2_cidr
}

module "gke" {
  source      = "./modules/gke"
  cluster_name = var.cluster_name
  region       = var.region
  network_id   = module.network.network_id
  subnet1_id   = module.network.subnet1_id
  node_count   = var.node_count
}