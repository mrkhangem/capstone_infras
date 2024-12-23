variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "region" {
  description = "Region for GKE cluster"
  type        = string
}

variable "network_id" {
  description = "ID of the VPC network"
  type        = string
}

variable "subnet1_id" {
  description = "ID of the primary subnet"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the GKE cluster"
  type        = number
}

variable "disk_size_gb" {
  type = number
  default = 50
}
variable "disk_type" {
  type = string
  default = "pd-standard"
}
variable "machine_type" {
  type = string
  default = "e2-small"
}