variable "project_id" {
  description = "The ID of the project to deploy to"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "web-app-cluster"
}

variable "location" {
  description = "The location of the GKE cluster"
  type        = string
  default     = "us-central1"
}

variable "cluster_ipv4_cidr_block" {
  description = "The IP address range for pods in the cluster"
  type        = string
  default     = "10.1.0.0/16"
}

variable "services_ipv4_cidr_block" {
  description = "The IP address range for services in the cluster"
  type        = string
  default     = "10.2.0.0/16"
}

variable "master_ipv4_cidr_block" {
  description = "The IP address range for the master network"
  type        = string
  default     = "172.16.0.0/28"
}

variable "network" {
  description = "The VPC network to host the cluster"
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork to host the cluster"
  type        = string
}

variable "release_channel" {
  description = "The release channel of the cluster"
  type        = string
  default     = "REGULAR"
}

variable "machine_type" {
  description = "The machine type for the GKE nodes"
  type        = string
  default     = "e2-medium"
}

variable "disk_size_gb" {
  description = "The disk size in GB for the GKE nodes"
  type        = number
  default     = 50
}

variable "initial_node_count" {
  description = "The initial number of nodes in the node pool"
  type        = number
  default     = 2
}

variable "min_node_count" {
  description = "The minimum number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "The maximum number of nodes in the node pool"
  type        = number
  default     = 5
}

variable "node_labels" {
  description = "Labels to apply to the nodes"
  type        = map(string)
  default = {
    environment = "production"
    app         = "web-app"
  }
}

variable "node_tags" {
  description = "Tags to apply to the nodes"
  type        = list(string)
  default     = ["gke-node", "web-app"]
}

variable "node_taints" {
  description = "Taints to apply to the nodes"
  type = list(object({
    key    = string
    value  = string
    effect = string
  }))
  default = []
} 