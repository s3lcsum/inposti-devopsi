# Variables for GKE Runtime Infrastructure

variable "project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The zone to deploy resources"
  type        = string
  default     = "us-central1-a"
}

# GKE Variables
variable "gke_cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "web-app-cluster"
}

variable "gke_cluster_ipv4_cidr_block" {
  description = "The IP address range for pods in the cluster"
  type        = string
  default     = "10.1.0.0/16"
}

variable "gke_services_ipv4_cidr_block" {
  description = "The IP address range for services in the cluster"
  type        = string
  default     = "10.2.0.0/16"
}

variable "gke_master_ipv4_cidr_block" {
  description = "The IP address range for the master network"
  type        = string
  default     = "172.16.0.0/28"
}

variable "gke_release_channel" {
  description = "The release channel of the cluster"
  type        = string
  default     = "REGULAR"
}

variable "gke_machine_type" {
  description = "The machine type for the GKE nodes"
  type        = string
  default     = "e2-medium"
}

variable "gke_disk_size_gb" {
  description = "The disk size in GB for the GKE nodes"
  type        = number
  default     = 50
}

variable "gke_initial_node_count" {
  description = "The initial number of nodes in the node pool"
  type        = number
  default     = 2
}

variable "gke_min_node_count" {
  description = "The minimum number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "gke_max_node_count" {
  description = "The maximum number of nodes in the node pool"
  type        = number
  default     = 5
}

variable "gke_node_labels" {
  description = "Labels to apply to the nodes"
  type        = map(string)
  default = {
    environment = "runtime"
    app         = "web-app"
  }
}

variable "gke_node_tags" {
  description = "Tags to apply to the nodes"
  type        = list(string)
  default     = ["gke-node", "web-app", "runtime"]
}

variable "gke_node_taints" {
  description = "Taints to apply to the nodes"
  type = list(object({
    key    = string
    value  = string
    effect = string
  }))
  default = []
}
