# GKE Infrastructure for Runtime Environment
# This creates the GKE cluster that hosts the application

# Use existing networking infrastructure
# Note: VPC should be created by terraform/networking/ first
# This configuration assumes the networking infrastructure is already deployed

# Create the GKE cluster for the application
module "gke" {
  source = "../../modules/gke"

  project_id                  = var.project_id
  cluster_name                = var.gke_cluster_name
  location                    = var.region
  network                     = "runtime-vpc"
  subnetwork                  = "runtime-subnet"
  cluster_ipv4_cidr_block     = var.gke_cluster_ipv4_cidr_block
  services_ipv4_cidr_block    = var.gke_services_ipv4_cidr_block
  master_ipv4_cidr_block      = var.gke_master_ipv4_cidr_block
  release_channel             = var.gke_release_channel
  machine_type                = var.gke_machine_type
  disk_size_gb                = var.gke_disk_size_gb
  initial_node_count          = var.gke_initial_node_count
  min_node_count              = var.gke_min_node_count
  max_node_count              = var.gke_max_node_count
  node_labels                 = var.gke_node_labels
  node_tags                   = var.gke_node_tags
  node_taints                 = var.gke_node_taints
} 