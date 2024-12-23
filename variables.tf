variable "network_name" {
  default     = "my-private-network"
  description = "Name of the VPC network"
}

variable "subnet1_cidr" {
  default     = "10.0.1.0/24"
  description = "CIDR range for the first subnet"
}

variable "subnet2_cidr" {
  default     = "10.0.2.0/24"
  description = "CIDR range for the second subnet"
}

variable "cluster_name" {
  default     = "my-cluster"
  description = "Name of the GKE cluster"
}


variable "node_count" {
  default     = 2
  description = "Number of nodes in the GKE cluster"
}

variable "project_id" {
  description = "black-cirrus-444210-r3"
  type        = string
  default = "black-cirrus-444210-r3"
}

variable "region" {
  description = "The region for the VPC"
  type        = string
  default = "asia-southeast1"
}